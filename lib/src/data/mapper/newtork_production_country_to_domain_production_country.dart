import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/entity/network_production_country.dart';
import 'package:the_movies_expore/src/domain/entity/production_country.dart';

@injectable
final class NewtorkProductionCountryToDomainProductionCountry {
  ProductionCountry call(
    NetworkProductionCountry networkProductionCountry,
  ) =>
      ProductionCountry(
        name: networkProductionCountry.name,
        iso_3166_1: networkProductionCountry.iso_3166_1,
      );
}
