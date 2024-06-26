part of 'movie_card.dart';

class _WideMovieCardShimmer extends StatelessWidget {
  const _WideMovieCardShimmer({super.key});

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
        width: 379,
        height: 273,
        child: Row(
          children: [
            const ShimmerPlaceholder(width: 182, height: 359),
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
                      ShimmerPlaceholder(width: 33, height: 24),
                      SizedBox(width: 4),
                      ShimmerPlaceholder(width: 120, height: 24),
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
