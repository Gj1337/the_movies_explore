import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/movie_card/movie_card.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';

class MoviesGridWidget extends StatelessWidget {
  const MoviesGridWidget({
    super.key,
    required this.movies,
    this.onMovieClick,
    this.onBookmarkClick,
    this.isLoading = false,
  });

  final List<Movie> movies;
  final void Function(Movie movie)? onMovieClick;
  final void Function(Movie movie)? onBookmarkClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final movieWidgets = isLoading
        ? List.generate(3, (_) => const MovieCard.wideMovieCardShimmer())
        : movies
            .map(
              (movie) => MovieCard.wide(
                movie,
                onCardClick: () => onMovieClick?.call(movie),
                onBookmarkClick: () => onBookmarkClick?.call(movie),
              ),
            )
            .toList();

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: defaultHorizontalPadding,
      runSpacing: defaultHorizontalPadding,
      children: movieWidgets,
    );
  }
}
