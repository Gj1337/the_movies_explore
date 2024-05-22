import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/domain/repository/movie_repository.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/cubit/search_screen_state.dart';
import 'package:the_movies_expore/src/presentation/utils/logger_mixin.dart';

@injectable
final class SearchSreenCubit extends Cubit<SearchSreenState> with LoggerMixin {
  SearchSreenCubit(
    this._movieRepository,
  ) : super(const SearchSreenState());

  final MovieRepository _movieRepository;

  int _currentPagination = 1;
  String? _query;
  String? _language;

  Future<void> searchMovies({
    required String name,
    required String language,
  }) async {
    logger.i('seachMovies query=$name');

    _currentPagination = 1;
    _query = null;
    _language = null;

    emit(
      state.copyWith(isLoading: true, totalResult: null),
    );

    try {
      final searchResult = await _movieRepository.searchMovies(
        name: name,
        language: language,
        page: _currentPagination,
      );

      _query = name;
      _language = language;

      emit(
        state.copyWith(
          totalResult: searchResult.totalResults,
          foundedMovies: searchResult.movies,
        ),
      );
    } catch (exception) {
      logger.e('seachMovies catch $exception');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> uploadMore() async {
    if (_query == null || _language == null) return;

    final pageNumber = _currentPagination + 1;

    try {
      final searchResult = await _movieRepository.searchMovies(
        name: _query ?? '',
        language: _language ?? '',
        page: pageNumber,
      );

      _currentPagination++;

      emit(
        state.copyWith(
          totalResult: searchResult.totalResults,
          foundedMovies: [
            ...?state.foundedMovies,
            ...searchResult.movies,
          ],
        ),
      );
    } catch (exception) {
      logger.e('seachMovies catch $exception');
    }
  }
}
