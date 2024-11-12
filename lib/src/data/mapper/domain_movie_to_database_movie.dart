import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/datasource/database/database.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';

@injectable
final class DomainMovieToDatabaseMovie {
  DatabaseMovie call(Movie movie) => DatabaseMovie(
        id: movie.id,
        title: movie.title,
        overview: movie.overview,
        vote: movie.vote,
        posterPath: movie.posterPath,
        backdropPath: movie.backdropPath,
        webUrl: movie.webUrl,
      );
}
