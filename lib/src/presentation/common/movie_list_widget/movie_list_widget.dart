// ignore_for_file: unused_field
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/movie_card/movie_card.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';

import 'package:flutter/material.dart';

part 'animated_movie_list.dart';
part 'movie_list_shimmer.dart';

enum _MovieListType {
  animatedMoviesList,
  moviesListShimmer,
}

class MovieListWidget extends StatelessWidget {
  ///This widget has to be inside CustomScrollView
  const MovieListWidget({
    super.key,
    required this.movies,
    this.onMovieClick,
    this.onBookmarkClick,
  })  : _moviesListType = _MovieListType.animatedMoviesList,
        shimmerCount = null;

  const MovieListWidget.shimmer({
    super.key,
    this.shimmerCount,
  })  : _moviesListType = _MovieListType.moviesListShimmer,
        movies = const [],
        onBookmarkClick = null,
        onMovieClick = null;

  final _MovieListType _moviesListType;

  final List<Movie> movies;
  final void Function(Movie movie)? onMovieClick;
  final void Function(Movie movie)? onBookmarkClick;
  final int? shimmerCount;

  @override
  Widget build(BuildContext context) => switch (_moviesListType) {
        _MovieListType.animatedMoviesList => _AnimatedMovieList(
            key: key,
            movies: movies,
            onBookmarkClick: onBookmarkClick,
            onMovieClick: onMovieClick,
          ),
        _MovieListType.moviesListShimmer => _MovieListShimmer(
            key: key,
            shimmersCount: shimmerCount,
          ),
      };
}
