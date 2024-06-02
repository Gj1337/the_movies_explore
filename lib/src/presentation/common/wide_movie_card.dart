import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/bookmark_button_widget.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
import 'package:the_movies_expore/src/presentation/common/movie_wide_rate_widget.dart';
import 'package:the_movies_expore/src/presentation/common/movie_image.dart';

const _pictureSize = Size(182, 359);

class WideMovieCard extends StatelessWidget {
  const WideMovieCard({
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
    final genreNames = movie.genres.map((genre) => genre.name).join(', ');

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 379,
        height: 273,
        child: Stack(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 182,
                  height: 359,
                  child: MovieImage(
                    imageUrl: movie.posterPath ?? '',
                    memCacheWidth: _pictureSize.width.toInt() * 2,
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
                        style: movieNameBroadCardTextStyle,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                      MovieWideRateWidget(
                        rate: movie.vote,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        genreNames,
                        style: genreMovieTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          movie.overview,
                          style: overviewMovieOnCardTextStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 6,
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
            )
          ],
        ),
      ),
    );
  }
}
