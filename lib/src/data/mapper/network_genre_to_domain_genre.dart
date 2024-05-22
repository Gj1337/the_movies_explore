import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/entity/network_genre.dart';
import 'package:the_movies_expore/src/domain/entity/genre.dart';

@injectable
final class NetworkGenreToDomainGenre {
  Genre call(NetworkGenre networkGenre) =>
      Genre(id: networkGenre.id, name: networkGenre.name);
}
