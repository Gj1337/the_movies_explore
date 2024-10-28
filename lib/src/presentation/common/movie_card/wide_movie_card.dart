part of 'movie_card.dart';

const _wideCardPictureSize = Size(182, 359);

class _WideMovieCard extends StatelessWidget {
  const _WideMovieCard({
    required this.movie,
    this.onCardClick,
    this.onBookmarkClick,
    this.cacheImage = false,
    super.key,
  });

  final Movie movie;
  final bool cacheImage;
  final VoidCallback? onCardClick;
  final VoidCallback? onBookmarkClick;

  @override
  Widget build(BuildContext context) {
    final genreNames = movie.genres.map((genre) => genre.name).join(', ');

    return Card(
      child: SizedBox(
        // width: 379,
        height: 273,
        child: Stack(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 182,
                  height: 359,
                  child: MovieImage(
                    isCaching: cacheImage,
                    imageUrl: movie.posterPath ?? '',
                    memCacheWidth: _wideCardPictureSize.width.toInt() * 2,
                  ),
                ),
                const SizedBox(width: defaultHorizontalPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        movie.title,
                        style: AppFonts.movieNameBroadCardTextStyle,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                      FittedBox(
                        child: MovieWideRateWidget(
                          rate: movie.vote,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        genreNames,
                        style: AppFonts.genreMovieTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          movie.overview,
                          style: AppFonts.overviewMovieOnCardTextStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 7,
                        ),
                      ),
                    ],
                  ),
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
              left: 135,
              child: BookmarkButtonWidget(
                inBookmarks: movie.isBookmarked,
                onPressed: onBookmarkClick,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
