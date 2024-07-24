import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_production_company.freezed.dart';
part 'network_production_company.g.dart';

@freezed
class NetworkProductionCompany with _$NetworkProductionCompany {
  const factory NetworkProductionCompany({
    required int id,
    required String name,
    @JsonKey(name: 'origin_country') required String originCountry,
    @JsonKey(name: 'logo_path') String? logoPath,
  }) = _NetworkProductionCompany;

  factory NetworkProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$NetworkProductionCompanyFromJson(json);
}
