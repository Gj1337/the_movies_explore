import 'package:freezed_annotation/freezed_annotation.dart';

part 'spoken_language.freezed.dart';

@freezed
class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    required String name,
    required String iso_639_1,
    required String englishName,
  }) = _SpokenLanguage;
}
