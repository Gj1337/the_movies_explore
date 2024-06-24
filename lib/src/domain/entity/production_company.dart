import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_company.freezed.dart';

@freezed
class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    required int id,
    required String name,
    required String originCountry,
    String? logoPath,
  }) = _ProductionCompany;
}
