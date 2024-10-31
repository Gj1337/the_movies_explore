import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/bookmark_button_widget.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_cubit.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_movies_wrapper.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';
import 'package:the_movies_expore/src/presentation/feature/detailed_screen/movie_header.dart';
import 'package:the_movies_expore/src/presentation/utils/localization_extension.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BookmarksMovieWrapperBuilder(
            movie: movie,
            builder: (movie) => SliverAppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              collapsedHeight: 200,
              backgroundColor: backgroundColor,
              pinned: true,
              expandedHeight: 550,
              actions: [
                IconButton(
                  onPressed: () => Share.shareUri(Uri.parse(movie.webUrl)),
                  icon: const Icon(Icons.share),
                ),
                BookmarkButtonWidget(
                  inBookmarks: movie.isBookmarked,
                  onPressed: () => context
                      .read<BookmarksCubit>()
                      .changeBookmarkStatus(movie),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.symmetric(
                  horizontal: defaultHorizontalPadding,
                  vertical: defaultVerticalPadding,
                ),
                title: MovieHeader(movie: movie),
                collapseMode: CollapseMode.pin,
                background: Stack(
                  children: [
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: movie.posterPath ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.transparent,
                            Colors.transparent,
                            backgroundColor,
                          ],
                          stops: const [0.0, 0.18, 0.5, 1.0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultHorizontalPadding,
              ),
              child: AnimatedReadMoreText(
                movie.overview,
                expandOnTextTap: false,
                textStyle: AppFonts.overviewMovie,
                readMoreText: context.localizations.showMore,
                readLessText: context.localizations.showLess,
                buttonTextStyle: AppFonts.link,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
