part of 'big_picture_movie_card.dart';

class BigPictureMovieCardShimmer extends StatelessWidget {
  const BigPictureMovieCardShimmer({super.key});

  @override
  Widget build(BuildContext context) => ShimmerWrapper(
        child: SizedBox(
          width: _bigPictureMovieCardWidth,
          height: _bigPictureMovieCardHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerPlaceholder(
                width: _bigPictureMovieCardWidth,
                height: _bigPicturePictureHeight,
              ),
              const SizedBox(height: 12),
              const ShimmerPlaceholder(height: 24),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Flexible(child: ShimmerPlaceholder(width: 33, height: 24)),
                  SizedBox(width: 4),
                  Flexible(child: ShimmerPlaceholder(width: 120, height: 24)),
                ],
              ),
            ],
          ),
        ),
      );
}
