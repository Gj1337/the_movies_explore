import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/domain/entity/movies_page.dart';

abstract interface class MovieRepository {
  Future<MoviesPage> searchMovies({
    required String name,
    required String language,
    int page = 1,
  });

  Stream<MoviesPage> topMoviesStream();

  Future<void> fetchTopMovies({
    required String language,
    int page = 1,
  });

  Stream<MoviesPage> popularMoviesStream();

  Future<void> fetchPopularMovies({
    required String language,
    int page = 1,
  });

  Stream<MoviesPage> bookmarkMoviesStream();

  Future<void> fetchBookmarkMovies({int page = 1});

  Future<void> bookmakrMovie(Movie movie);

  Future<void> undoBookmarMovie(Movie movie);
}
