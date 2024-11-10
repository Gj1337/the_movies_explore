import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_movies_expore/src/presentation/common/bookmark_button_widget.dart';
import 'package:the_movies_expore/src/presentation/feature/detailed_screen/cubit/detailed_screen_cubit.dart';
import 'package:the_movies_expore/src/presentation/feature/detailed_screen/cubit/detailed_screen_state.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';
import 'package:the_movies_expore/src/presentation/utils/localization_extension.dart';

class DetailedScreenWidget extends StatelessWidget {
  const DetailedScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return BlocBuilder<DetailedScreenCubit, DetailedScreenState>(
      builder: (context, state) {
        final DetailedScreenState(
          :detailedMovie,
          isLoading: cubitLoading,
        ) = state;

        final appBar = SliverAppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: backgroundColor,
          pinned: true,
          expandedHeight: 550,
          actions: [
            if (detailedMovie != null)
              IconButton(
                onPressed: () =>
                    Share.shareUri(Uri.parse(detailedMovie.webUrl)),
                icon: const Icon(Icons.share),
              ),
            if (detailedMovie != null)
              BookmarkButtonWidget(movie: detailedMovie.movie),
          ],
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.symmetric(
              horizontal: defaultHorizontalPadding,
              vertical: defaultVerticalPadding,
            ),
            title: detailedMovie != null
                ? Text(
                    detailedMovie.title,
                    style: AppFonts.bigHeader,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  )
                : null,
            collapseMode: CollapseMode.pin,
            background: detailedMovie != null
                ? Stack(
                    children: [
                      Positioned.fill(
                        child: CachedNetworkImage(
                          imageUrl: detailedMovie.posterPath ?? '',
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
                  )
                : null,
          ),
        );

        final body = SliverToBoxAdapter(
          child: detailedMovie != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultHorizontalPadding,
                  ),
                  child: AnimatedReadMoreText(
                    detailedMovie.overview,
                    expandOnTextTap: false,
                    textStyle: AppFonts.overviewMovie,
                    readMoreText: context.localizations.showMore,
                    readLessText: context.localizations.showLess,
                    buttonTextStyle: AppFonts.link,
                  ),
                )
              : SizedBox.shrink(),
        );

        return CustomScrollView(
          slivers: [
            appBar,
            body,
            SliverToBoxAdapter(
              child: Container(
                height: 900,
                color: Colors.amber,
              ),
            )
          ],
        );
      },
    );
  }
}
