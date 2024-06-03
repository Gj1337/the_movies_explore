import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/bookmark_button_widget.dart';
import 'package:the_movies_expore/src/presentation/common/movie_image.dart';
import 'package:the_movies_expore/src/presentation/common/movie_wide_rate_widget.dart';
import 'package:the_movies_expore/src/presentation/common/shimmer/shimmer_placeholder.dart';
import 'package:the_movies_expore/src/presentation/common/shimmer/shimmer_wrapper.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';

part 'wide_movie_card.dart';
part 'big_picture_movie_card.dart';
part 'big_picture_movie_card_shimmer.dart';
part 'wide_movie_card_shimmer.dart';

enum _CardType {
  bigPicture,
  bigPictureShimmer,
  wide,
  wideShimmer,
}

class MovieCard extends StatelessWidget {
  // ignore: library_private_types_in_public_api
  final _CardType cardType;
  final Movie? movie;

  final VoidCallback? onCardClick;
  final VoidCallback? onBookmarkClick;

  const MovieCard.wide(
    this.movie, {
    super.key,
    this.onCardClick,
    this.onBookmarkClick,
  }) : cardType = _CardType.wide;

  const MovieCard.bitPicture(
    this.movie, {
    super.key,
    this.onCardClick,
    this.onBookmarkClick,
  }) : cardType = _CardType.bigPicture;

  const MovieCard.bigPictureShimmer({super.key})
      : cardType = _CardType.bigPictureShimmer,
        movie = null,
        onCardClick = null,
        onBookmarkClick = null;

  const MovieCard.wideMovieCardShimmer({super.key})
      : cardType = _CardType.wideShimmer,
        movie = null,
        onCardClick = null,
        onBookmarkClick = null;

  @override
  Widget build(BuildContext context) {
    return switch (cardType) {
      _CardType.bigPicture => _PigPictureMovieCard(
          movie: movie!,
          key: key,
          onBookmarkClick: onBookmarkClick,
          onCardClick: onCardClick,
        ),
      _CardType.wide => _WideMovieCard(
          movie: movie!,
          key: key,
          onBookmarkClick: onBookmarkClick,
          onCardClick: onCardClick,
        ),
      _CardType.bigPictureShimmer => _BigPictureMovieCardShimmer(key: key),
      _CardType.wideShimmer => _WideMovieCardShimmer(key: key),
    };
  }
}
