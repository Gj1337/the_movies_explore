import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';

part 'search_screen_state.freezed.dart';

@freezed
class SearchSreenState with _$SearchSreenState {
  const factory SearchSreenState({
    List<Movie>? foundedMovies,
    int? totalResult,
    @Default(false) bool isLoading,
  }) = _SearchSreenState;
}
