import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/movie_card/movie_card.dart';
import 'package:the_movies_expore/src/presentation/utils/animation_speed.dart';

const _height = 275.0;

class CarouselMoviesWidget extends StatelessWidget {
  const CarouselMoviesWidget({
    required this.movies,
    super.key,
    this.isLoading = false,
    this.onMovieClick,
    this.onBookmarkClick,
    this.cacheImage = false,
  });

  final List<Movie> movies;
  final bool cacheImage;
  final void Function(Movie movie)? onMovieClick;
  final void Function(Movie movie)? onBookmarkClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final movieWidgets = isLoading
        ? List.generate(3, (_) => const MovieCard.bigPictureShimmer())
        : movies
            .map(
              (movie) => MovieCard.bitPicture(
                movie,
                cacheImage: cacheImage,
                onBookmarkClick: () => onBookmarkClick?.call(movie),
                onCardClick: () => onMovieClick?.call(movie),
              ),
            )
            .toList();

    return Center(
      child: AnimatedSwitcher(
        duration: AnimationSpeed.normal.duration,
        child: CarouselSlider(
          items: movieWidgets,
          options: CarouselOptions(
            autoPlay: true,
            height: _height,
            enableInfiniteScroll: false,
          ),
        ),
      ),
    );
  }
}
