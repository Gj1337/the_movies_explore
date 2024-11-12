import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_movie.freezed.dart';
part 'network_movie.g.dart';

@freezed
class NetworkMovie with _$NetworkMovie {
  const factory NetworkMovie({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'vote_average') required double vote,
    @JsonKey(name: 'genre_ids') required List<int> genresId,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
  }) = _NetworkMovie;

  factory NetworkMovie.fromJson(Map<String, dynamic> json) =>
      _$NetworkMovieFromJson(json);
}
