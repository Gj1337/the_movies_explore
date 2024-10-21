import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_movies_collection.freezed.dart';
part 'network_movies_collection.g.dart';

@freezed
class NetworkMoviesCollection with _$NetworkMoviesCollection {
  const factory NetworkMoviesCollection({
    required int id,
    required String name,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
  }) = _NetworkMoviesCollection;

  factory NetworkMoviesCollection.fromJson(Map<String, dynamic> json) =>
      _$NetworkMoviesCollectionFromJson(json);
}
