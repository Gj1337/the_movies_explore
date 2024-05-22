import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/entity/network_movie.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';

@injectable
final class DomainMovieToNetworkMovie {
  NetworkMovie call(Movie movie) {
    return NetworkMovie(
      id: movie.id,
      title: movie.title,
      overview: movie.overview,
      vote: movie.vote * 2,
      genresId: movie.genres.map((genre) => genre.id).toList(),
      posterPath: movie.posterPath,
      backdropPath: movie.backdropPath,
    );
  }
}
