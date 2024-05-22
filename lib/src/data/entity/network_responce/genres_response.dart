import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movies_expore/src/data/entity/network_genre.dart';

part 'genres_response.freezed.dart';
part 'genres_response.g.dart';

@freezed
class GenresResponse with _$GenresResponse {
  const factory GenresResponse({
    required List<NetworkGenre> genres,
  }) = _GenresResponse;

  factory GenresResponse.fromJson(Map<String, dynamic> json) =>
      _$GenresResponseFromJson(json);
}
