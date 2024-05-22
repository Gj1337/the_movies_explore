import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';

part 'bookmarks_state.freezed.dart';

@freezed
class BookmarksState with _$BookmarksState {
  const factory BookmarksState({
    @Default([]) List<Movie> bookmarkedMovies,
  }) = _BookmarksState;
}
