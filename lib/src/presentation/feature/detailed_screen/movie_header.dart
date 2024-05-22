import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/movie_wide_rate_widget.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          movie.title,
          style: bigHeaderTextStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
        const SizedBox(height: 8),
        MovieWideRateWidget(rate: movie.vote),
      ],
    );
  }
}
