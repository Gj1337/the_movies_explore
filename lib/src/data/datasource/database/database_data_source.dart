import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/datasource/database/database.dart';
import 'package:the_movies_expore/src/data/datasource/database/entity/movies_group.dart';
import 'package:the_movies_expore/src/data/datasource/database/entity/partition.dart';

@Singleton()
final class DatabaseDataSource {
  DatabaseDataSource(this._appDatabase);

  final AppDatabase _appDatabase;

  late final _moviesTable = _appDatabase.moviesTable;
  late final _movieGroupsTable = _appDatabase.movieGroupsTable;
  late final _genresTable = _appDatabase.genresTable;

  Future<List<DatabaseMovie>> _getMoviesByGroup({
    required MoviesGroup group,
    Partition? partition,
  }) async {
    final allMoviesWithMoviesGroupJoin = innerJoin(
      _movieGroupsTable,
      _movieGroupsTable.movieId.equalsExp(_moviesTable.id),
    );

    final query = _moviesTable.select().join(
      [allMoviesWithMoviesGroupJoin],
    );

    if (partition != null) {
      query.limit(
        partition.limit,
        offset: partition.offset,
      );
    }

    final result = await query.get();

    final movies = result.map((row) => row.readTable(_moviesTable)).toList();

    return movies;
  }

  Future<void> _updateMovies(List<DatabaseMovie> movies) => _appDatabase.batch(
        (batch) => batch.insertAllOnConflictUpdate(
          _moviesTable,
          movies,
        ),
      );

  Future<void> _replaceMoviesByGroup({
    required MoviesGroup group,
    required List<DatabaseMovie> movies,
  }) async {
    await _updateMovies(movies);

    await _movieGroupsTable.deleteWhere(
      (row) => row.group.equals(group.index),
    );

    await _movieGroupsTable.insertAll(
      movies.map(
        (movie) => MovieGroupsTableCompanion.insert(
          movieId: movie.id,
          group: group,
        ),
      ),
    );
  }

  Future<List<DatabaseGenre>> getGanres() => _genresTable.all().get();

  Future<void> updateGancres(List<DatabaseGenre> ganres) => _appDatabase.batch(
        (batch) => batch.insertAllOnConflictUpdate(_genresTable, ganres),
      );

  Future<List<DatabaseMovie>> getPopularMovies({Partition? partition}) =>
      _getMoviesByGroup(
        group: MoviesGroup.popular,
        partition: partition,
      );

  Future<List<DatabaseMovie>> getBookmaredMovies({Partition? partition}) =>
      _getMoviesByGroup(
        group: MoviesGroup.bookmarked,
        partition: partition,
      );

  Future<List<DatabaseMovie>> getTopRatedMovies({Partition? partition}) =>
      _getMoviesByGroup(
        group: MoviesGroup.topRated,
        partition: partition,
      );

  Future<void> bookmarkMovie(DatabaseMovie movie) async {
    await _updateMovies([movie]);

    await _movieGroupsTable.insertOnConflictUpdate(
      MovieGroupsTableCompanion.insert(
        movieId: movie.id,
        group: MoviesGroup.bookmarked,
      ),
    );
  }

  Future<void> unbookmarkMovie(int moiveId) =>
      _movieGroupsTable.deleteWhere((row) => row.movieId.equals(moiveId));

  Future<void> updateTopRatedMovies(List<DatabaseMovie> movies) =>
      _replaceMoviesByGroup(
        group: MoviesGroup.topRated,
        movies: movies,
      );

  Future<void> updatePopularMovies(List<DatabaseMovie> movies) =>
      _replaceMoviesByGroup(
        group: MoviesGroup.popular,
        movies: movies,
      );

  Future<void> matchMoviesWithGanre(
    Map<DatabaseMovie, List<DatabaseGenre>> moviesWithGanre,
  ) async {
    final moviesGroupList = moviesWithGanre.keys
        .map(
          (movie) => moviesWithGanre[movie]!.map(
            (genre) => MovieGenresTableCompanion.insert(
              movieId: movie.id,
              genreId: genre.id,
            ),
          ),
        )
        .expand((element) => element)
        .toList();

    _appDatabase.batch(
      (batch) {
        batch.insertAllOnConflictUpdate(
          _movieGroupsTable,
          moviesGroupList,
        );
      },
    );
  }
}
