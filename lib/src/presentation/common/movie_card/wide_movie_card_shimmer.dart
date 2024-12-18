part of 'wide_movie_card.dart';

class WideMovieCardShimmer extends StatelessWidget {
  const WideMovieCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final descriptionShimmer = List.generate(
      7,
      (_) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: ShimmerPlaceholder(height: 16),
      ),
    );

    return ShimmerWrapper(
      child: SizedBox(
        height: _wideCardPictureSizeHeight,
        child: Row(
          children: [
            const ShimmerPlaceholder(
              width: _wideCardPictureSizeWidth,
              height: _wideCardPictureSizeHeight,
            ),
            const SizedBox(width: defaultHorizontalPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  const ShimmerPlaceholder(height: 29),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Flexible(
                        child: ShimmerPlaceholder(width: 33, height: 24),
                      ),
                      SizedBox(width: 4),
                      Flexible(
                        child: ShimmerPlaceholder(width: 120, height: 24),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Card(
                    child: ShimmerPlaceholder(height: 20),
                  ),
                  const SizedBox(height: 10),
                  Expanded(child: Column(children: descriptionShimmer)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
