import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/entity/network_responce/genres_response.dart';
import 'package:the_movies_expore/src/data/entity/network_responce/pagination_list_movie_responce.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef JSON = Map<String, dynamic>;

const _topRatedKey = 'topRatedKey';
const _latestRatedKey = 'latestRatedKey';
const _bookmaredRatedKey = 'bookmaredRatedKey';
const _genresKey = 'ganreKey';

@singleton
final class LocalStorageSource {
  LocalStorageSource(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  String _formatTopRatedKey(int page) => '$_topRatedKey/$page';
  String _formatLatestRatedKey(int page) => '$_latestRatedKey/$page';
  String _formatBookmaredRatedKey(int page) => '$_bookmaredRatedKey/$page';

  PaginationMovieListResponse? _getPaginationMovieListResponse(String key) {
    final rawData = _sharedPreferences.getString(key);

    if (rawData == null) return null;

    final json = jsonDecode(rawData) as JSON;

    final paginationMovieListResponse =
        PaginationMovieListResponse.fromJson(json);

    return paginationMovieListResponse;
  }

  void _putPaginationMovieListResponse(
    PaginationMovieListResponse paginationMovieListResponse,
    String key,
  ) {
    final json = paginationMovieListResponse.toJson();

    final string = jsonEncode(json);

    _sharedPreferences.setString(key, string);
  }

  void putGenresResponse(GenresResponse genresResponse) {
    final json = genresResponse.toJson();

    final string = jsonEncode(json);

    _sharedPreferences.setString(_genresKey, string);
  }

  GenresResponse? getGenresResponse() {
    final rawData = _sharedPreferences.getString(_genresKey);

    if (rawData == null) return null;

    final json = jsonDecode(rawData) as JSON;

    final genresResponse = GenresResponse.fromJson(json);

    return genresResponse;
  }

  PaginationMovieListResponse? getTopRatedMovies(int page) =>
      _getPaginationMovieListResponse(_formatTopRatedKey(page));

  PaginationMovieListResponse? getLatestMovies(int page) =>
      _getPaginationMovieListResponse(_formatLatestRatedKey(page));

  PaginationMovieListResponse? getBookmaredMovies(int page) =>
      _getPaginationMovieListResponse(_formatBookmaredRatedKey(page));

  void putTopRatedMovies(
    PaginationMovieListResponse paginationMovieListResponse,
  ) =>
      _putPaginationMovieListResponse(
        paginationMovieListResponse,
        _formatTopRatedKey(paginationMovieListResponse.page),
      );

  void putLatestMovies(
    PaginationMovieListResponse paginationMovieListResponse,
  ) =>
      _putPaginationMovieListResponse(
        paginationMovieListResponse,
        _formatLatestRatedKey(paginationMovieListResponse.page),
      );

  void putBookmaredMovies(
    PaginationMovieListResponse paginationMovieListResponse,
  ) =>
      _putPaginationMovieListResponse(
        paginationMovieListResponse,
        _formatBookmaredRatedKey(paginationMovieListResponse.page),
      );
}
