import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_production_country.freezed.dart';
part 'network_production_country.g.dart';

@freezed
class NetworkProductionCountry with _$NetworkProductionCountry {
  const factory NetworkProductionCountry({
    required String name,
    required String iso_3166_1,
  }) = _NetworkProductionCountry;

  factory NetworkProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$NetworkProductionCountryFromJson(json);
}
