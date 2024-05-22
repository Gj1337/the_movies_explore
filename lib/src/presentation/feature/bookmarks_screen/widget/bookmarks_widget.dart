import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_expore/src/movies_app.dart';
import 'package:the_movies_expore/src/presentation/common/big_header_text.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_cubit.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_movies_wrapper.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_state.dart';
import 'package:the_movies_expore/src/presentation/common/movies_grid_widget.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
import 'package:the_movies_expore/src/presentation/utils/localization_extension.dart';

class BookmarksWidget extends StatelessWidget {
  const BookmarksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    onCardClick(movie) => context.pushNamed(
          Routes.detailedScreen.name,
          extra: movie,
        );

    onBookmarkClick(movie) =>
        context.read<BookmarksCubit>().changeBookmarkStatus(movie);

    return Scaffold(
      appBar: AppBar(
        title: BigHeaderText(
          context.localizations.bookmakrs,
        ),
      ),
      body: BlocBuilder<BookmarksCubit, BookmarksState>(
        builder: (_, state) => BookmarksMoviesWrapperBuilder(
          movies: state.bookmarkedMovies,
          builder: (movies) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultHorizontalPadding,
            ),
            child: SingleChildScrollView(
              child: MoviesGridWidget(
                onBookmarkClick: onBookmarkClick,
                onMovieClick: onCardClick,
                movies: movies,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
