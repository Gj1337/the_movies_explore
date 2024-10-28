import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/movie_wide_rate_widget.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';

class WideCardHeader extends StatelessWidget {
  const WideCardHeader({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final genreNames = movie.genres.map((genre) => genre.name).join(',');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          movie.title,
          style: AppFonts.movieNameBroadCardTextStyle,
          overflow: TextOverflow.clip,
          maxLines: 2,
        ),
        MovieWideRateWidget(
          rate: movie.vote,
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
            maxLines: 6,
          ),
        ),
      ],
    );
  }
}
