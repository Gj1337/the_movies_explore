import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/datasource/database/database.dart';
import 'package:the_movies_expore/src/data/mapper/database_genre_to_domain_genre.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';

@injectable
final class DatabaseMovieWithGanresToDomainMovie {
  DatabaseMovieWithGanresToDomainMovie(this._databaseGenreToDomainGenre);

  final DatabaseGenreToDomainGenre _databaseGenreToDomainGenre;

  Movie call({
    required DatabaseMovie databaseMovie,
    required List<DatabaseGenre> databaseGenres,
  }) =>
      Movie(
        id: databaseMovie.id,
        title: databaseMovie.title,
        overview: databaseMovie.overview,
        vote: databaseMovie.vote,
        posterPath: databaseMovie.posterPath,
        backdropPath: databaseMovie.backdropPath,
        webUrl: databaseMovie.webUrl,
        genres: databaseGenres.map(_databaseGenreToDomainGenre.call).toList(),
      );
}
