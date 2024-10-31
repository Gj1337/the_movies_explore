import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';

part 'main_screen_state.freezed.dart';

@freezed
class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    @Default([]) List<Movie> topMovies,
    @Default([]) List<Movie> latestMovies,
    @Default(false) bool isLoading,
  }) = _MainScreenState;
}
