import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/domain/entity/movies_page.dart';
import 'package:the_movies_expore/src/domain/repository/movie_repository.dart';
import 'package:the_movies_expore/src/presentation/feature/main_screen/cubit/main_screen_state.dart';
import 'package:the_movies_expore/src/presentation/utils/logger_mixin.dart';

@lazySingleton
final class MainScreenCubit extends Cubit<MainScreenState> with LoggerMixin {
  MainScreenCubit(
    this._movieRepository,
  ) : super(const MainScreenState());

  final MovieRepository _movieRepository;

  StreamSubscription<MoviesPage>? _latestMoviesStreamSubscription;

  StreamSubscription<MoviesPage>? _topMoviesStreamSubscription;

  Future<void> onCreate(String language) async {
    logger.i('onCreate language $language');

    _topMoviesStreamSubscription =
        _movieRepository.topMoviesStream().listen(_onTopMoviesChanged);

    _latestMoviesStreamSubscription =
        _movieRepository.popularMoviesStream().listen(_onLatestMoviesChanged);

    try {
      await _movieRepository.fetchTopMovies(language: language);

      await _movieRepository.fetchPopularMovies(language: language);
    } catch (exception) {
      logger.e('onCreate catch $exception');
    }
  }

  Future<void> onPageRefresh(String language) async {
    await _movieRepository.fetchTopMovies(language: language);
    await _movieRepository.fetchPopularMovies(language: language);
  }

  void _onLatestMoviesChanged(MoviesPage moviesPage) {
    emit(state.copyWith(latestMovies: moviesPage.movies));
  }

  void _onTopMoviesChanged(MoviesPage moviesPage) {
    emit(state.copyWith(topMovies: moviesPage.movies));
  }

  @override
  Future<void> close() async {
    _latestMoviesStreamSubscription?.cancel();
    _topMoviesStreamSubscription?.cancel();

    return super.close();
  }
}
