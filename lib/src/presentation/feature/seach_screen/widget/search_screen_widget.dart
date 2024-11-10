import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_expore/src/movies_app.dart';
import 'package:the_movies_expore/src/presentation/common/big_header_text.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_cubit.dart';
import 'package:the_movies_expore/src/presentation/common/movie_list_widget/movie_list.dart';
import 'package:the_movies_expore/src/presentation/common/movie_list_widget/movie_list_shimmer.dart';
import 'package:the_movies_expore/src/presentation/common/scroll_up_button_widget.dart';
import 'package:the_movies_expore/src/presentation/common/scroll_update_widget.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/widget/search_screen_info_banner.dart/search_screen_info_banner.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/cubit/search_screen_cubit.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/cubit/search_screen_state.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/widget/search_line_widget.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/widget/search_result_count_widget.dart';
import 'package:the_movies_expore/src/presentation/utils/localization_extension.dart';

class SearchScreenWidget extends StatelessWidget {
  const SearchScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final language = Localizations.localeOf(context).languageCode;

    Future<Object?> onCardClick(movie) => context.pushNamed(
          Routes.detailedScreen.name,
          extra: movie,
        );

    Future<void> onBookmarkClick(movie) =>
        context.read<BookmarksCubit>().changeBookmarkStatus(movie);

    return BlocBuilder<SearchSreenCubit, SearchSreenState>(
      builder: (context, state) {
        final moviesList = MovieList(
          movies: state.foundedMovies ?? [],
          onMovieClick: onCardClick,
          onBookmarkClick: onBookmarkClick,
        );

        final searchBlock = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchLineWidget(
              onTextChanged: (text) =>
                  context.read<SearchSreenCubit>().searchMovies(
                        name: text,
                        language: language,
                      ),
            ),
            const SizedBox(height: defaultHorizontalPadding),
            if (state.isLoading) const Center(child: LinearProgressIndicator()),
            SizedBox(
              height: 26,
              child: state.totalResult != null
                  ? SearchResultCount(
                      count: state.totalResult ?? 0,
                    )
                  : null,
            ),
            const SizedBox(height: defaultHorizontalPadding),
          ],
        );

        return Scaffold(
          appBar: AppBar(
            title: BigHeaderText(context.localizations.search),
          ),
          body: Stack(
            children: [
              ScrollUpdateWidget(
                onGetBorder: context.read<SearchSreenCubit>().uploadMore,
                border: 70,
                builder: (scrollController) => ScrollUpButtonWrapper(
                  scrollController: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultHorizontalPadding,
                    ),
                    child: CustomScrollView(
                      cacheExtent: 1500,
                      controller: scrollController,
                      slivers: [
                        SliverToBoxAdapter(child: searchBlock),
                        state.isLoading
                            ? MovieListShimmer(shimmersCount: 6)
                            : moviesList,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(child: SerchScreenInfoBanner()),
            ],
          ),
        );
      },
    );
  }
}
