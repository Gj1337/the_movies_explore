import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/presentation/common/movie_card/wide_movie_card.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';

class MovieListShimmer extends StatelessWidget {
  const MovieListShimmer({
    this.shimmersCount = 1,
    super.key,
  });

  final int shimmersCount;

  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => const Padding(
            padding:
                EdgeInsets.symmetric(vertical: defaultHorizontalPadding / 2),
            child: WideMovieCardShimmer(),
          ),
          childCount: shimmersCount,
        ),
      );
}
