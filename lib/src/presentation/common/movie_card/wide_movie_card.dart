import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/bookmark_button_widget.dart';
import 'package:the_movies_expore/src/presentation/common/movie_image.dart';
import 'package:the_movies_expore/src/presentation/common/movie_wide_rate_widget.dart';
import 'package:the_movies_expore/src/presentation/common/shimmer/shimmer_placeholder.dart';
import 'package:the_movies_expore/src/presentation/common/shimmer/shimmer_wrapper.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';

part 'wide_movie_card_shimmer.dart';

const _wideCardPictureSizeWidth = 182.0;
const _wideCardPictureSizeHeight = 273.0;

class WideMovieCard extends StatelessWidget {
  const WideMovieCard(
    this.movie, {
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

    final clickWrapper = Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onCardClick,
        ),
      ),
    );

    final bookmarkButton = Positioned(
      left: 135,
      child: BookmarkButtonWidget(
        inBookmarks: movie.isBookmarked,
        onPressed: onBookmarkClick,
      ),
    );

    return Card(
      child: SizedBox(
        height: _wideCardPictureSizeHeight,
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
                    memCacheWidth: _wideCardPictureSizeWidth.toInt() * 2,
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
                        style: AppFonts.movieNameBroadCard,
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
                        style: AppFonts.genreMovie,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          movie.overview,
                          style: AppFonts.overviewMovieOnCard,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 7,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            clickWrapper,
            bookmarkButton,
          ],
        ),
      ),
    );
  }
}
