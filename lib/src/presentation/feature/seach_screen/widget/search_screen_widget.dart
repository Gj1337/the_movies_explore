import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_expore/src/movies_app.dart';
import 'package:the_movies_expore/src/presentation/common/big_header_text.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_cubit.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_movies_wrapper.dart';
import 'package:the_movies_expore/src/presentation/common/movie_list_widget/movie_list_widget.dart';
import 'package:the_movies_expore/src/presentation/common/scroll_up_button_widget.dart';
import 'package:the_movies_expore/src/presentation/common/scroll_update_widget.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
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

    onCardClick(movie) => context.pushNamed(
          Routes.detailedScreen.name,
          extra: movie,
        );

    onBookmarkClick(movie) =>
        context.read<BookmarksCubit>().changeBookmarkStatus(movie);

    return BlocBuilder<SearchSreenCubit, SearchSreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: BigHeaderText(context.localizations.search),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultHorizontalPadding,
            ),
            child: ScrollUpdateWidget(
              onGetBorder: context.read<SearchSreenCubit>().uploadMore,
              border: 70,
              builder: (scrollController) => ScrollUpButtonWidget(
                scrollController: scrollController,
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
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
                          if (state.totalResult != null)
                            SearchResultCount(
                              count: state.totalResult ?? 0,
                            ),
                          const SizedBox(height: defaultHorizontalPadding),
                          if (state.isLoading)
                            const Center(child: LinearProgressIndicator()),
                        ],
                      ),
                    ),
                    if (!state.isLoading)
                      BookmarksMoviesWrapperBuilder(
                        movies: state.foundedMovies ?? [],
                        builder: (movies) => MovieListWidget(
                          movies: movies,
                          onMovieClick: onCardClick,
                          onBookmarkClick: onBookmarkClick,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
