import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/datasource/database/database_data_source.dart';
import 'package:the_movies_expore/src/data/datasource/local_storage_source.dart';
import 'package:the_movies_expore/src/data/datasource/network/network_data_source.dart';
import 'package:the_movies_expore/src/data/datasource/network/entity/responces/genres_response.dart';
import 'package:the_movies_expore/src/data/datasource/network/entity/responces/pagination_list_movie_responce.dart';
import 'package:the_movies_expore/src/data/mapper/database_movie_with_genres_to_domain_movie.dart';
import 'package:the_movies_expore/src/data/mapper/domain_genre_to_database_genre.dart';
import 'package:the_movies_expore/src/data/mapper/domain_movie_to_database_movie.dart';
import 'package:the_movies_expore/src/data/mapper/domain_movie_to_network_movie.dart';
import 'package:the_movies_expore/src/data/mapper/network_detailed_movie_to_domain_detailed_movie.dart';
import 'package:the_movies_expore/src/data/mapper/pagination_list_movie_responce_to_domain_movies_page.dart';
import 'package:the_movies_expore/src/domain/entity/detailed_movie.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/domain/entity/movies_page.dart';
import 'package:the_movies_expore/src/domain/repository/movie_repository.dart';

// const Movie

@LazySingleton(as: MovieRepository)
final class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(
    this._networkDataSource,
    this._paginationListMovieResponceToDomainMoviesPage,
    this._databaseDataSource,
    this._domainMovieToNetworkMovie,
    this._networkDetailedMovieToDomainDetailedMovie,
    this._localStorageSource,
    this._domainMovieToDatabaseMovie,
    this._domainGenreToDatabaseGenre,
    this._databaseMovieWithGanresToDomainMovie,
  );

  final NetworkDataSource _networkDataSource;
  @Deprecated('Use [_appDatabase]')
  final LocalStorageSource _localStorageSource;
  final DatabaseDataSource _databaseDataSource;

  final PaginationListMovieResponceToDomainMoviesPage
      _paginationListMovieResponceToDomainMoviesPage;
  final DomainMovieToNetworkMovie _domainMovieToNetworkMovie;
  final NetworkDetailedMovieToDomainDetailedMovie
      _networkDetailedMovieToDomainDetailedMovie;
  final DomainMovieToDatabaseMovie _domainMovieToDatabaseMovie;
  final DomainGenreToDatabaseGenre _domainGenreToDatabaseGenre;
  final DatabaseMovieWithGanresToDomainMovie
      _databaseMovieWithGanresToDomainMovie;

  final _popularMoviesStreamController =
      StreamController<MoviesPage>.broadcast();
  final _topMoviesStreamController = StreamController<MoviesPage>.broadcast();
  final _bookmarkedMoviesStreamController =
      StreamController<MoviesPage>.broadcast();

  @override
  Future<MoviesPage> searchMovies({
    required String name,
    required String language,
    int page = 1,
  }) async {
    final queryResult = await _networkDataSource.searchMovie(
      query: name,
      language: language,
      page: page,
    );

    final networkGenresResponce =
        await _networkDataSource.getGanres(language: language);

    return _paginationListMovieResponceToDomainMoviesPage(
      queryResult,
      networkGenresResponce.genres,
    );
  }

  @override
  Stream<MoviesPage> popularMoviesStream() =>
      _popularMoviesStreamController.stream;

  @override
  Future<void> fetchPopularMovies({
    required String language,
    int page = 1,
  }) async {
    final currentDate = DateTime.now().toIso8601String();

    PaginationMovieListResponse? queryResponse;
    GenresResponse? genresResponse;

    try {
      queryResponse = await _networkDataSource.discoverMovies(
        primaryReleaseDate: currentDate,
        language: language,
        page: page,
      );

      genresResponse = await _networkDataSource.getGanres(language: language);

      _localStorageSource.putLatestMovies(queryResponse);

      _localStorageSource.putGenresResponse(genresResponse);
    } on DioException catch (_) {
      queryResponse = _localStorageSource.getLatestMovies(page);

      genresResponse = _localStorageSource.getGenresResponse();

      rethrow;
    } finally {
      if (queryResponse != null && genresResponse != null) {
        final moviePage = _paginationListMovieResponceToDomainMoviesPage(
          queryResponse,
          genresResponse.genres,
        );

        _popularMoviesStreamController.add(moviePage);
      }
    }
  }

  @override
  Stream<MoviesPage> topMoviesStream() => _topMoviesStreamController.stream;

  @override
  Future<void> fetchTopMovies({
    required String language,
    int page = 1,
  }) async {
    PaginationMovieListResponse? queryResponse;
    GenresResponse? genresResponse;

    try {
      queryResponse = await _networkDataSource.getPopularMovies(
        language: language,
        page: page,
      );

      genresResponse = await _networkDataSource.getGanres(language: language);

      _localStorageSource.putTopRatedMovies(queryResponse);

      _localStorageSource.putGenresResponse(genresResponse);
    } on DioException catch (_) {
      queryResponse = _localStorageSource.getTopRatedMovies(page);

      genresResponse = _localStorageSource.getGenresResponse();

      rethrow;
    } finally {
      if (queryResponse != null && genresResponse != null) {
        final moviePage = _paginationListMovieResponceToDomainMoviesPage(
          queryResponse,
          genresResponse.genres,
        );

        _topMoviesStreamController.add(moviePage);
      }
    }
  }

  @override
  Stream<MoviesPage> bookmarkMoviesStream() =>
      _bookmarkedMoviesStreamController.stream;

  @override
  Future<void> fetchBookmarkMovies({int page = 1}) async {
    final databaseMovies = await _databaseDataSource.getBookmaredMovies();
    final databaseGenres = await _databaseDataSource.getGanres();

    final movies = databaseMovies
        .map(
          (databaseMovie) => _databaseMovieWithGanresToDomainMovie.call(
            databaseMovie: databaseMovie,
            databaseGenres: databaseGenres,
          ),
        )
        .toList();

    final moviePage = MoviesPage(
      page: 1,
      totalResults: movies.length,
      totalPages: 1,
      movies: movies,
    );

    _bookmarkedMoviesStreamController.add(moviePage);
  }

  @override
  Future<void> bookmakrMovie(Movie movie) async {
    final databaseMovie = _domainMovieToDatabaseMovie(movie);
    final databseGenres =
        movie.genres.map(_domainGenreToDatabaseGenre.call).toList();

    await _databaseDataSource.bookmarkMovie(databaseMovie);
    await _databaseDataSource
        .matchMoviesWithGanre({databaseMovie: databseGenres});

    final updatedDatabaseBookmarkMovies =
        await _databaseDataSource.getBookmaredMovies();
    final updatedDatabaseGenres = await _databaseDataSource.getGanres();

    final updatedMovies = updatedDatabaseBookmarkMovies
        .map(
          (databaseMovie) => _databaseMovieWithGanresToDomainMovie.call(
            databaseMovie: databaseMovie,
            databaseGenres: updatedDatabaseGenres,
          ),
        )
        .toList();

    final moviesPage = MoviesPage(
      page: 1,
      totalResults: updatedMovies.length,
      totalPages: 1,
      movies: updatedMovies,
    );

    _bookmarkedMoviesStreamController.add(moviesPage);
  }

  @override
  Future<void> undoBookmarMovie(Movie movie) async {
    await _databaseDataSource.unbookmarkMovie(movie.id);

    final updatedDatabaseBookmarkMovies =
        await _databaseDataSource.getBookmaredMovies();
    final updatedDatabaseGenres = await _databaseDataSource.getGanres();

    final updatedMovies = updatedDatabaseBookmarkMovies
        .map(
          (databaseMovie) => _databaseMovieWithGanresToDomainMovie.call(
            databaseMovie: databaseMovie,
            databaseGenres: updatedDatabaseGenres,
          ),
        )
        .toList();

    final moviesPage = MoviesPage(
      page: 1,
      totalResults: updatedMovies.length,
      totalPages: 1,
      movies: updatedMovies,
    );

    _bookmarkedMoviesStreamController.add(moviesPage);
  }

  @override
  Future<DetailedMovie> getDetailedMovie({
    required int id,
  }) async {
    final newtorkDetailedMovie = await _networkDataSource.getDetailsMovie(id);

    final domainDetailedMovie = _networkDetailedMovieToDomainDetailedMovie(
      newtorkDetailedMovie,
    );

    return domainDetailedMovie;
  }

  @override
  @disposeMethod
  Future<void> dispose() async {
    await _popularMoviesStreamController.close();
    await _bookmarkedMoviesStreamController.close();
    await _topMoviesStreamController.close();
  }
}
