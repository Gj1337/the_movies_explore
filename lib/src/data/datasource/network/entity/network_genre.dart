import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_genre.freezed.dart';
part 'network_genre.g.dart';

@freezed
class NetworkGenre with _$NetworkGenre {
  const factory NetworkGenre({
    required int id,
    required String name,
  }) = _NetworkGenre;

  factory NetworkGenre.fromJson(Map<String, dynamic> json) =>
      _$NetworkGenreFromJson(json);
}
