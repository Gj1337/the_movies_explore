import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movies_expore/src/domain/entity/detailed_movie.dart';

part 'detailed_screen_state.freezed.dart';

@freezed
class DetailedScreenState with _$DetailedScreenState {
  const factory DetailedScreenState({
    DetailedMovie? detailedMovie,
    @Default(false) bool isLoading,
  }) = _DetailedScreenState;
}
