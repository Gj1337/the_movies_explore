import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/cubit/search_screen_error.dart';

part 'search_screen_state.freezed.dart';

@freezed
class SearchSreenState with _$SearchSreenState {
  const factory SearchSreenState({
    List<Movie>? foundedMovies,
    int? totalResult,
    @Default(false) bool isLoading,
    SearchScreenError? error,
  }) = _SearchSreenState;
}
