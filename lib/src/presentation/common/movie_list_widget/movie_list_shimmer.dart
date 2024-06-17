part of 'movie_list_widget.dart';

class _MovieListShimmer extends StatelessWidget {
  const _MovieListShimmer({
    super.key,
    this.shimmersCount = 1,
  });

  final int? shimmersCount;

  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, int index) => const Padding(
            padding:
                EdgeInsets.symmetric(vertical: defaultHorizontalPadding / 2),
            child: MovieCard.wideMovieCardShimmer(),
          ),
          childCount: shimmersCount,
        ),
      );
}
