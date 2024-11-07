import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/app_icons.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_cubit.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_state.dart';
import 'package:the_movies_expore/src/presentation/utils/animation_speed.dart';

class BookmarkButtonWidget extends StatelessWidget {
  const BookmarkButtonWidget({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BookmarksCubit, BookmarksState>(
        builder: (context, state) {
          final inBookmarks = state.bookmarkedMovies
              .any((bookmarkedMovie) => bookmarkedMovie.id == movie.id);

          final bookmarksCubit = context.read<BookmarksCubit>();

          return IconButton(
            onPressed: () {
              HapticFeedback.lightImpact();

              bookmarksCubit.changeBookmarkStatus(movie);
            },
            icon: AnimatedSwitcher(
              duration: AnimationSpeed.fast.duration,
              child: SvgPicture.asset(
                key: ValueKey(inBookmarks),
                inBookmarks
                    ? AppIcons.bookmarkActiveImage
                    : AppIcons.bookMarkDefaultImage,
                width: 24,
                height: 24,
              ),
            ),
          );
        },
      );
}
