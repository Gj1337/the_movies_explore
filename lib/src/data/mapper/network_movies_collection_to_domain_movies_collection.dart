import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/datasource/network/entity/network_movies_collection.dart';
import 'package:the_movies_expore/src/domain/entity/movies_collection.dart';

@injectable
final class NetworkMoviesCollectionToDomainMoviesCollection {
  MoviesCollection call(NetworkMoviesCollection networkMoviesCollection) =>
      MoviesCollection(
        id: networkMoviesCollection.id,
        name: networkMoviesCollection.name,
        posterPath: networkMoviesCollection.posterPath,
        backdropPath: networkMoviesCollection.backdropPath,
      );
}
