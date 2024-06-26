import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_collection.freezed.dart';

@freezed
class MoviesCollection with _$MoviesCollection {
  const factory MoviesCollection({
    required int id,
    required String name,
    String? posterPath,
    String? backdropPath,
  }) = _MoviesCollection;
}
