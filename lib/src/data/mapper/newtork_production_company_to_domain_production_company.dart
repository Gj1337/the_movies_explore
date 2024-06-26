import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/entity/network_production_company.dart';
import 'package:the_movies_expore/src/domain/entity/production_company.dart';

@injectable
final class NetworkProductionCompanyToDomainProductionCompany {
  ProductionCompany call(NetworkProductionCompany networkProductionCompany) =>
      ProductionCompany(
        id: networkProductionCompany.id,
        name: networkProductionCompany.name,
        originCountry: networkProductionCompany.originCountry,
        logoPath: networkProductionCompany.logoPath,
      );
}
