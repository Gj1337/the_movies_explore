import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movies_expore/src/data/datasource/network/entity/network_movie.dart';

part 'pagination_list_movie_responce.freezed.dart';
part 'pagination_list_movie_responce.g.dart';

@freezed
class PaginationMovieListResponse with _$PaginationMovieListResponse {
  const factory PaginationMovieListResponse({
    required int page,
    @JsonKey(name: 'total_results') required int totalResults,
    @JsonKey(name: 'total_pages') required int totalPages,
    required List<NetworkMovie> results,
  }) = _PaginationMovieListResponse;

  factory PaginationMovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginationMovieListResponseFromJson(json);
}
