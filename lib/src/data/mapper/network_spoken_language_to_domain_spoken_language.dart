import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/entity/network_spoken_language.dart';
import 'package:the_movies_expore/src/domain/entity/spoken_language.dart';

@injectable
final class NetworkSpokenLanguageToDomainSpokenLanguage {
  SpokenLanguage call(NetworkSpokenLanguage networkSpokenLanguage) =>
      SpokenLanguage(
        name: networkSpokenLanguage.name,
        iso_639_1: networkSpokenLanguage.iso_639_1,
        englishName: networkSpokenLanguage.englishName,
      );
}
