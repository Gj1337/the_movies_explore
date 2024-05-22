import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_cubit.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_state.dart';

class BookmarksMovieWrapperBuilder extends StatelessWidget {
  const BookmarksMovieWrapperBuilder({
    super.key,
    required this.builder,
    required this.movie,
  });

  final Movie movie;
  final Widget Function(Movie movie) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarksCubit, BookmarksState>(builder: (_, state) {
      final isMovieBookmarked =
          state.bookmarkedMovies.map((movie) => movie.id).contains(movie.id);

      return builder(movie.copyWith(isBookmarked: isMovieBookmarked));
    });
  }
}

class BookmarksMoviesWrapperBuilder extends StatelessWidget {
  const BookmarksMoviesWrapperBuilder({
    super.key,
    required this.builder,
    required this.movies,
  });

  final List<Movie> movies;
  final Widget Function(List<Movie> movies) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarksCubit, BookmarksState>(
      builder: (_, state) {
        final updatedMovies = movies.map(
          (movie) {
            final isMovieBookmarked = state.bookmarkedMovies
                .map((movie) => movie.id)
                .contains(movie.id);

            return movie.copyWith(isBookmarked: isMovieBookmarked);
          },
        ).toList();

        return builder(updatedMovies);
      },
    );
  }
}
