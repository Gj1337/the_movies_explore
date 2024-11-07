import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/movie_card/big_picture_movie_card.dart';
import 'package:the_movies_expore/src/presentation/utils/animation_speed.dart';

const _height = 275.0;

class CarouselMoviesWidget extends StatelessWidget {
  const CarouselMoviesWidget({
    required this.movies,
    super.key,
    this.isLoading = false,
    this.onMovieClick,
    this.cacheImage = false,
  });

  final List<Movie> movies;
  final bool cacheImage;
  final void Function(Movie movie)? onMovieClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final movieWidgets = isLoading
        ? List.generate(3, (_) => const BigPictureMovieCardShimmer())
        : movies
            .map(
              (movie) => BigPictureMovieCard(
                movie,
                cacheImage: cacheImage,
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
