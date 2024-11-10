import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/movies_app.dart';
import 'package:the_movies_expore/src/presentation/common/bookmark_button_widget.dart';
import 'package:the_movies_expore/src/presentation/common/movie_image.dart';
import 'package:the_movies_expore/src/presentation/common/movie_wide_rate_widget.dart';
import 'package:the_movies_expore/src/presentation/common/shimmer/shimmer_placeholder.dart';
import 'package:the_movies_expore/src/presentation/common/shimmer/shimmer_wrapper.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';

part 'big_picture_movie_card_shimmer.dart';

const _bigPictureMovieCardWidth = 300.0;
const _bigPictureMovieCardHeight = 275.0;
const _bigPicturePictureHeight = 200.0;

class BigPictureMovieCard extends StatelessWidget {
  const BigPictureMovieCard(
    this.movie, {
    this.cacheImage = false,
    super.key,
  });

  final Movie movie;
  final bool cacheImage;

  void _onCardClick(BuildContext context) {
    context.pushNamed(
      Routes.detailedScreen.name,
      pathParameters: {'movieId': movie.id.toString()},
    );
  }

  @override
  Widget build(BuildContext context) {
    final clickWrapper = Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _onCardClick(context),
        ),
      ),
    );

    final bookmarkButton = Positioned(
      child: Align(
        alignment: Alignment.topRight,
        child: BookmarkButtonWidget(movie: movie),
      ),
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: _bigPictureMovieCardWidth,
        height: _bigPictureMovieCardHeight,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: _bigPictureMovieCardWidth,
                  height: _bigPicturePictureHeight,
                  child: MovieImage(
                    imageUrl: movie.backdropPath ?? movie.posterPath ?? '',
                    memCacheWidth: _bigPictureMovieCardWidth.toInt() * 2,
                    isCaching: cacheImage,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  movie.title,
                  style: AppFonts.movieNameBroadCard,
                  overflow: TextOverflow.ellipsis,
                ),
                MovieWideRateWidget(
                  rate: movie.vote,
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
