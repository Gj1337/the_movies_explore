import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_expore/src/movies_app.dart';
import 'package:the_movies_expore/src/presentation/common/big_header_text.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_cubit.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_movies_wrapper.dart';
import 'package:the_movies_expore/src/presentation/common/scroll_up_button_widget.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
import 'package:the_movies_expore/src/presentation/feature/main_screen/cubit/main_screen_cubit.dart';
import 'package:the_movies_expore/src/presentation/feature/main_screen/cubit/main_screen_state.dart';
import 'package:the_movies_expore/src/presentation/common/movie_list_widget/movie_list_widget.dart';
import 'package:the_movies_expore/src/presentation/feature/main_screen/widget/carousel_movies_widget.dart';
import 'package:the_movies_expore/src/presentation/utils/localization_extension.dart';

const _carouselLength = 10;

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Future<Object?> onCardClick(movie) => context.pushNamed(
          Routes.detailedScreen.name,
          extra: movie,
        );

    Future<void> onBookmarkClick(movie) =>
        context.read<BookmarksCubit>().changeBookmarkStatus(movie);

    Future<void> onPageRefresh() {
      final language = Localizations.localeOf(context).languageCode;

      return context.read<MainScreenCubit>().onPageRefresh(language);
    }

    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (_, state) {
        final MainScreenState(:topMovies, :latestMovies) = state;

        final carouselMovies =
            topMovies.sublist(0, min(topMovies.length, _carouselLength));

        final isLatestMoviesLoading = latestMovies.isEmpty;
        final isTopScreenMoviesLoading = carouselMovies.isEmpty;

        return RefreshIndicator(
          onRefresh: onPageRefresh,
          child: ScrollUpButtonWidget(
            scrollController: scrollController,
            child: CustomScrollView(
              cacheExtent: 1500,
              controller: scrollController,
              slivers: [
                SliverStickyHeader(
                  sticky: false,
                  header: AppBar(
                    title: BigHeaderText(context.localizations.topTen),
                  ),
                  sliver: SliverToBoxAdapter(
                    child: BookmarksMoviesWrapperBuilder(
                      movies: carouselMovies,
                      builder: (movies) => CarouselMoviesWidget(
                        onBookmarkClick: onBookmarkClick,
                        onMovieClick: onCardClick,
                        movies: movies,
                        isLoading: isTopScreenMoviesLoading,
                        cacheImage: true,
                      ),
                    ),
                  ),
                ),
                SliverStickyHeader(
                  header: ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: AppBar(
                      title: BigHeaderText(context.localizations.popular),
                    ),
                  ),
                  sliver: SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultHorizontalPadding,
                    ),
                    sliver: isLatestMoviesLoading
                        ? const MovieListWidget.shimmer(shimmerCount: 3)
                        : BookmarksMoviesWrapperBuilder(
                            movies: latestMovies,
                            builder: (movies) => MovieListWidget(
                              onBookmarkClick: onBookmarkClick,
                              onMovieClick: onCardClick,
                              movies: movies,
                              cacheImages: true,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }
}
