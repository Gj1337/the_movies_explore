import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/movie_card/wide_movie_card.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    required this.movies,
    super.key,
    this.onMovieClick,
    this.onBookmarkClick,
    this.cacheImages = false,
  });

  final List<Movie> movies;
  final void Function(Movie movie)? onMovieClick;
  final void Function(Movie movie)? onBookmarkClick;
  final bool cacheImages;

  @override
  Widget build(BuildContext context) => movies.isEmpty
      ? SliverToBoxAdapter()
      : SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: movies.length,
            (context, index) {
              final movie = movies[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: defaultVerticalPadding / 2,
                ),
                child: WideMovieCard(
                  movie,
                  onCardClick: () => onMovieClick?.call(movie),
                  onBookmarkClick: () => onBookmarkClick?.call(movie),
                  cacheImage: cacheImages,
                ),
              );
            },
          ),
        );
}
