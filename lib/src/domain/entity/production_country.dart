import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_country.freezed.dart';

@freezed
class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    required String name,
    required String iso_3166_1,
  }) = _ProductionCountry;
}
