import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/config.dart';
import 'package:the_movies_expore/src/data/entity/network_movie.dart';
import 'package:the_movies_expore/src/domain/entity/genre.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';

@injectable
final class NetworkMovieToDomainMovie {
  Movie call(
    NetworkMovie networkMovie,
    List<Genre> genres,
  ) =>
      Movie(
        id: networkMovie.id,
        posterPath: '$imageUrl${networkMovie.posterPath}',
        backdropPath: '$imageUrl${networkMovie.backdropPath}',
        title: networkMovie.title,
        vote: networkMovie.vote / 2,
        overview: networkMovie.overview,
        webUrl: '$hostSiteUrl/movie/${networkMovie.id}',
        genres: genres
            .where((genre) => networkMovie.genresId.contains(genre.id))
            .toList(),
      );
}
