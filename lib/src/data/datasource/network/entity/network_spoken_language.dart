import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_spoken_language.freezed.dart';
part 'network_spoken_language.g.dart';

@freezed
class NetworkSpokenLanguage with _$NetworkSpokenLanguage {
  const factory NetworkSpokenLanguage({
    required String name,
    required String iso_639_1,
    @JsonKey(name: 'english_name') required String englishName,
  }) = _NetworkSpokenLanguage;

  factory NetworkSpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$NetworkSpokenLanguageFromJson(json);
}
