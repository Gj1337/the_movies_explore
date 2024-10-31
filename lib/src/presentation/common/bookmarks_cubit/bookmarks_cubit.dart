import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/domain/entity/movies_page.dart';
import 'package:the_movies_expore/src/domain/repository/movie_repository.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_state.dart';
import 'package:the_movies_expore/src/presentation/utils/logger_mixin.dart';

@injectable
final class BookmarksCubit extends Cubit<BookmarksState> with LoggerMixin {
  BookmarksCubit(
    this._movieRepository,
  ) : super(const BookmarksState());

  final MovieRepository _movieRepository;

  StreamSubscription<MoviesPage>? _bookmarkMoviesStreamSubscription;

  Future<void> onCreate() async {
    logger.i('onCreate l');

    _bookmarkMoviesStreamSubscription = _movieRepository
        .bookmarkMoviesStream()
        .listen(_onbookmarkedMoviesChanged);

    try {
      await _movieRepository.fetchBookmarkMovies();
    } catch (exception) {
      logger.e('onCreate catch $exception');
    }
  }

  Future<void> changeBookmarkStatus(Movie movie) async {
    final isBookmarked = movie.isBookmarked;

    logger.i('changeBookmarkStatus movie ${movie.id}');

    try {
      isBookmarked
          ? await _movieRepository.undoBookmarMovie(movie)
          : await _movieRepository.bookmakrMovie(movie);
    } catch (exception) {
      logger.e('onCreate catch $exception');
    }
  }

  void _onbookmarkedMoviesChanged(MoviesPage movies) {
    emit(state.copyWith(bookmarkedMovies: movies.movies));
  }

  @override
  Future<void> close() async {
    _bookmarkMoviesStreamSubscription?.cancel();

    return super.close();
  }
}
