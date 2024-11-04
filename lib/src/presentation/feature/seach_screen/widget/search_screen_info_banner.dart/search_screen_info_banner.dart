import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/cubit/search_screen_cubit.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/cubit/search_screen_state.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/widget/search_screen_info_banner.dart/enter_movie_title_banner.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/widget/search_screen_info_banner.dart/not_found_movies_by_search_banner.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/widget/search_screen_info_banner.dart/something_went_wrong_banner.dart';

class SerchScreenInfoBanner extends StatelessWidget {
  const SerchScreenInfoBanner({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SearchSreenCubit, SearchSreenState>(
        builder: (context, state) {
          final showTypeWidget =
              state.foundedMovies == null && state.error == null;
          final showEmptyList = state.foundedMovies?.isEmpty == true;
          final showErrorBanner =
              state.error != null && state.foundedMovies?.length != 0;

          if (state.isLoading) {
            return SizedBox.shrink();
          } else if (showTypeWidget) {
            return const EnterMovieTitleBanner();
          } else if (showEmptyList) {
            return const NotFoundMoviesBySearchBanner();
          } else if (showErrorBanner) {
            return SomethingWentWrongBanner();
          } else {
            return SizedBox.shrink();
          }
        },
      );
}
