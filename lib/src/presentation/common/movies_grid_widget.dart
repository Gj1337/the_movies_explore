import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
import 'package:the_movies_expore/src/presentation/common/wide_movie_card.dart';

class MoviesGridWidget extends StatelessWidget {
  const MoviesGridWidget({
    super.key,
    required this.movies,
    this.onMovieClick,
    this.onBookmarkClick,
  });

  final List<Movie> movies;
  final void Function(Movie movie)? onMovieClick;
  final void Function(Movie movie)? onBookmarkClick;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: defaultHorizontalPadding,
      runSpacing: defaultHorizontalPadding,
      children: movies
          .map((movie) => WideMovieCard(
              onCardClick: () => onMovieClick?.call(movie),
              onBookmarkClick: () => onBookmarkClick?.call(movie),
              movie: movie))
          .toList(),
    );
  }
}
