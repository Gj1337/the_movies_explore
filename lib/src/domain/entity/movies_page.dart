import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';

part 'movies_page.freezed.dart';

@freezed
class MoviesPage with _$MoviesPage {
  const factory MoviesPage({
    required int page,
    required int totalResults,
    required int totalPages,
    required List<Movie> movies,
  }) = _SearchResult;
}
