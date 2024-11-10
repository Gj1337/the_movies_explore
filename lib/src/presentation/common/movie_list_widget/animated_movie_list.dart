import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/movie_card/wide_movie_card.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';

class AnimatedMovieList extends StatefulWidget {
  const AnimatedMovieList({
    required this.movies,
    super.key,
    this.onMovieClick,
    this.onBookmarkClick,
    this.cacheImages = false,
  });

  final List<Movie> movies;
  final bool cacheImages;
  final void Function(Movie movie)? onMovieClick;
  final void Function(Movie movie)? onBookmarkClick;

  @override
  State<AnimatedMovieList> createState() => _AnimatedMovieListState();
}

class _AnimatedMovieListState extends State<AnimatedMovieList> {
  final _animationKey = GlobalKey<SliverAnimatedListState>();

  Widget _itemBuilder(
    Movie movie,
    BuildContext context,
    Animation<double> animation,
  ) =>
      SizeTransition(
        sizeFactor: animation,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultVerticalPadding / 2,
          ),
          child: WideMovieCard(
            movie,
            cacheImage: widget.cacheImages,
          ),
        ),
      );

  @override
  void didUpdateWidget(covariant AnimatedMovieList oldWidget) {
    final itemWereRemoved = widget.movies.length < oldWidget.movies.length;

    final itemsWereAdded = widget.movies.length > oldWidget.movies.length;

    if (itemsWereAdded) {
      _animationKey.currentState?.insertAllItems(
        oldWidget.movies.length,
        widget.movies.length - oldWidget.movies.length,
      );
    } else if (itemWereRemoved) {
      for (final oldMovie in oldWidget.movies) {
        if (!widget.movies.contains(oldMovie)) {
          _animationKey.currentState?.removeItem(
            oldWidget.movies.indexOf(oldMovie),
            (context, animation) => _itemBuilder(oldMovie, context, animation),
          );
        }
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => SliverAnimatedList(
        key: _animationKey,
        initialItemCount: widget.movies.length,
        itemBuilder: (context, index, animation) =>
            _itemBuilder(widget.movies[index], context, animation),
      );
}
