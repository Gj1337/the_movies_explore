import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/bookmark_button_widget.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
import 'package:the_movies_expore/src/presentation/common/movie_wide_rate_widget.dart';
import 'package:the_movies_expore/src/presentation/common/movie_image.dart';

const _pictureSize = Size(300, 200);

class CarouselMovieCard extends StatelessWidget {
  const CarouselMovieCard({
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
        width: 300,
        height: 275,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: _pictureSize.width,
                  height: _pictureSize.height,
                  child: MovieImage(
                    imageUrl: movie.backdropPath ?? movie.posterPath ?? '',
                    memCacheWidth: _pictureSize.width.toInt() * 2,
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
