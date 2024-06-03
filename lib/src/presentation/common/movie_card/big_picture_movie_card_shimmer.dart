part of 'movie_card.dart';

class _BigPictureMovieCardShimmer extends StatelessWidget {
  const _BigPictureMovieCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      child: SizedBox(
        width: _bigPictureMovieCardSize.width,
        height: _bigPictureMovieCardSize.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerPlaceholder(
              width: _bigPicturePictureSize.width,
              height: _bigPicturePictureSize.height,
            ),
            const SizedBox(height: 12),
            const ShimmerPlaceholder(height: 24),
            const SizedBox(height: 12),
            const Row(
              children: [
                ShimmerPlaceholder(width: 33, height: 24),
                SizedBox(width: 4),
                ShimmerPlaceholder(width: 120, height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
