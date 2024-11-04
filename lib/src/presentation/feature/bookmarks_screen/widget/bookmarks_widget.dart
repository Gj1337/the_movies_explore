import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_expore/src/movies_app.dart';
import 'package:the_movies_expore/src/presentation/common/big_header_text.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_cubit.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_movies_wrapper.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_state.dart';
import 'package:the_movies_expore/src/presentation/common/movie_list_widget/animated_movie_list.dart';
import 'package:the_movies_expore/src/presentation/common/scroll_up_button_widget.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';
import 'package:the_movies_expore/src/presentation/utils/localization_extension.dart';

class BookmarksWidget extends StatefulWidget {
  const BookmarksWidget({super.key});

  @override
  State<BookmarksWidget> createState() => _BookmarksWidgetState();
}

class _BookmarksWidgetState extends State<BookmarksWidget> {
  late final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Future<Object?> onCardClick(movie) => context.pushNamed(
          Routes.detailedScreen.name,
          extra: movie,
        );

    Future<void> onBookmarkClick(movie) =>
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
          builder: (movies) => ScrollUpButtonWrapper(
            scrollController: scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultHorizontalPadding,
              ),
              child: CustomScrollView(
                cacheExtent: 1500,
                controller: scrollController,
                slivers: [
                  AnimatedMovieList(
                    onBookmarkClick: onBookmarkClick,
                    onMovieClick: onCardClick,
                    movies: movies,
                    cacheImages: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }
}
