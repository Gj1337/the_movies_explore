import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movies_expore/src/domain/entity/genre.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required String overview,
    required double vote,
    required List<Genre> genres,
    required String webUrl,
    String? posterPath,
    String? backdropPath,
    @Default(false) bool isBookmarked,
  }) = _Movie;
}
