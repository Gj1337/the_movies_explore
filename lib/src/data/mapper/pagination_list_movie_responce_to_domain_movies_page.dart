import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/entity/network_genre.dart';
import 'package:the_movies_expore/src/data/entity/network_responce/pagination_list_movie_responce.dart';
import 'package:the_movies_expore/src/data/mapper/network_genre_to_domain_genre.dart';
import 'package:the_movies_expore/src/data/mapper/network_movie_to_domain_movie.dart';
import 'package:the_movies_expore/src/domain/entity/movies_page.dart';

@injectable
final class PaginationListMovieResponceToDomainMoviesPage {
  PaginationListMovieResponceToDomainMoviesPage(
    this._networkGenreToDomainGenre,
    this._networkMovieToDomainMovie,
  );

  final NetworkGenreToDomainGenre _networkGenreToDomainGenre;
  final NetworkMovieToDomainMovie _networkMovieToDomainMovie;

  MoviesPage call(
    PaginationMovieListResponse paginationListMovieResponce,
    List<NetworkGenre> networkGenreList,
  ) {
    final domainGenreList =
        networkGenreList.map(_networkGenreToDomainGenre.call).toList();

    final domainMovies = paginationListMovieResponce.results
        .map(
          (networkMovie) =>
              _networkMovieToDomainMovie.call(networkMovie, domainGenreList),
        )
        .toList();

    return MoviesPage(
      page: paginationListMovieResponce.page,
      totalResults: paginationListMovieResponce.totalResults,
      movies: domainMovies,
      totalPages: paginationListMovieResponce.totalPages,
    );
  }
}
