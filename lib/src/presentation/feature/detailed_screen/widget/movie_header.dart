import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/detailed_movie.dart';
import 'package:the_movies_expore/src/presentation/common/movie_wide_rate_widget.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({
    required this.movie,
    super.key,
  });

  final DetailedMovie movie;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            movie.title,
            style: AppFonts.bigHeader,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          const SizedBox(height: 8),
          MovieWideRateWidget(rate: movie.vote),
        ],
      );
}
