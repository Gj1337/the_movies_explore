part of 'movie_card.dart';

const _bigPictureMovieCardSize = Size(300, 275);
const _bigPicturePictureSize = Size(300, 200);

class _PigPictureMovieCard extends StatelessWidget {
  const _PigPictureMovieCard({
    super.key,
    required this.movie,
    this.onCardClick,
    this.onBookmarkClick,
  });

  final Movie movie;
  final VoidCallback? onCardClick;
  final VoidCallback? onBookmarkClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: _bigPictureMovieCardSize.width,
        height: _bigPictureMovieCardSize.height,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: _bigPicturePictureSize.width,
                  height: _bigPicturePictureSize.height,
                  child: MovieImage(
                    imageUrl: movie.backdropPath ?? movie.posterPath ?? '',
                    memCacheWidth: _bigPicturePictureSize.width.toInt() * 2,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  movie.title,
                  style: movieNameBroadCardTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                MovieWideRateWidget(
                  rate: movie.vote,
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onCardClick,
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.topRight,
                child: BookmarkButtonWidget(
                  inBookmarks: movie.isBookmarked,
                  onPressed: onBookmarkClick,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
