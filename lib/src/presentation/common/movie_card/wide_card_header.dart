import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/movie_wide_rate_widget.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';

class WideCardHeader extends StatelessWidget {
  const WideCardHeader({
    super.key,
    required this.movie,
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
    );
  }
}
