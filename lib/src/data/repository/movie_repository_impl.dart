import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/datasource/local_storage_source.dart';
import 'package:the_movies_expore/src/data/datasource/network_data_source.dart';
import 'package:the_movies_expore/src/data/entity/network_responce/genres_response.dart';
import 'package:the_movies_expore/src/data/entity/network_responce/pagination_list_movie_responce.dart';
import 'package:the_movies_expore/src/data/mapper/domain_movie_to_network_movie.dart';
import 'package:the_movies_expore/src/data/mapper/pagination_list_movie_responce_to_domain_movies_page.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/domain/entity/movies_page.dart';
import 'package:the_movies_expore/src/domain/repository/movie_repository.dart';

@LazySingleton(as: MovieRepository)
final class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(
    this._networkDataSource,
    this._paginationListMovieResponceToDomainMoviesPage,
    this._localStorageSource,
    this._domainMovieToNetworkMovie,
  );

  final NetworkDataSource _networkDataSource;
  final LocalStorageSource _localStorageSource;

  final PaginationListMovieResponceToDomainMoviesPage
      _paginationListMovieResponceToDomainMoviesPage;
  final DomainMovieToNetworkMovie _domainMovieToNetworkMovie;

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
      final moviePage = _paginationListMovieResponceToDomainMoviesPage(
        queryResponse!,
        genresResponse!.genres,
      );

      _popularMoviesStreamController.add(moviePage);
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
      final moviePage = _paginationListMovieResponceToDomainMoviesPage(
        queryResponse!,
        genresResponse!.genres,
      );

      _topMoviesStreamController.add(moviePage);
    }
  }

  @override
  Stream<MoviesPage> bookmarkMoviesStream() =>
      _bookmarkedMoviesStreamController.stream;

  @override
  Future<void> fetchBookmarkMovies({int page = 1}) async {
    final networkGenres = [...?_localStorageSource.getGenresResponse()?.genres];

    final savedBookmakrsMoviesRepsonse =
        _localStorageSource.getBookmaredMovies(page);

    if (savedBookmakrsMoviesRepsonse == null) return;

    final moviePage = _paginationListMovieResponceToDomainMoviesPage(
      savedBookmakrsMoviesRepsonse,
      networkGenres,
    );

    _bookmarkedMoviesStreamController.add(moviePage);
  }

  @override
  Future<void> bookmakrMovie(Movie movie) async {
    final savedBookmakrsMoviesRepsonse =
        _localStorageSource.getBookmaredMovies(1);

    final savedBookmakrsMovies = savedBookmakrsMoviesRepsonse?.results ?? [];

    final networkMovie = _domainMovieToNetworkMovie(movie);

    final newBookmakrsMovies = [...savedBookmakrsMovies, networkMovie];

    final a = PaginationMovieListResponse(
        page: 1,
        totalResults: newBookmakrsMovies.length,
        totalPages: 1,
        results: newBookmakrsMovies);

    _localStorageSource.putBookmaredMovies(a);

    final genresResponse =
        _localStorageSource.getGenresResponse()?.genres ?? [];

    final moviePage =
        _paginationListMovieResponceToDomainMoviesPage(a, genresResponse);

    _bookmarkedMoviesStreamController.add(moviePage);
  }

  @override
  Future<void> undoBookmarMovie(Movie movie) async {
    final savedBookmakrsMoviesRepsonse =
        _localStorageSource.getBookmaredMovies(1);

    if (savedBookmakrsMoviesRepsonse == null) return;

    final movies = [...savedBookmakrsMoviesRepsonse.results];

    movies.removeWhere(
      (bookmarkedMovie) => bookmarkedMovie.id == movie.id,
    );

    final newBookmakrsMovies =
        savedBookmakrsMoviesRepsonse.copyWith(results: movies);

    _localStorageSource.putBookmaredMovies(newBookmakrsMovies);

    final genresResponse =
        _localStorageSource.getGenresResponse()?.genres ?? [];

    final moviePage = _paginationListMovieResponceToDomainMoviesPage(
        newBookmakrsMovies, genresResponse);

    _bookmarkedMoviesStreamController.add(moviePage);
  }
}
