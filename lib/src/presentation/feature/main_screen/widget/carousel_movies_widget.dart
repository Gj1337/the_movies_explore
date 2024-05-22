import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/loding_widget.dart';
import 'package:the_movies_expore/src/presentation/feature/main_screen/widget/carousel_movie_card.dart';
import 'package:the_movies_expore/src/presentation/utils/animation_speed.dart';

const _height = 275.0;

class CarouselMoviesWidget extends StatelessWidget {
  const CarouselMoviesWidget({
    super.key,
    required this.movies,
    this.isLoading = false,
    this.onMovieClick,
    this.onBookmarkClick,
  });

  final List<Movie> movies;
  final void Function(Movie movie)? onMovieClick;
  final void Function(Movie movie)? onBookmarkClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final movieWidgets = movies
        .map(
          (movie) => CarouselMovieCard(
            movie: movie,
            onBookmarkClick: () => onBookmarkClick?.call(movie),
            onCardClick: () => onMovieClick?.call(movie),
          ),
        )
        .toList();

    return Center(
      child: AnimatedSwitcher(
        duration: AnimationSpeed.normal.duration,
        child: isLoading
            ? Container(
                height: _height,
                alignment: Alignment.center,
                child: const LoadingWidget(),
              )
            : CarouselSlider(
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
