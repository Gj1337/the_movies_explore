import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/presentation/common/app_icons.dart';
import 'package:the_movies_expore/src/presentation/common/info_banner.dart';
import 'package:the_movies_expore/src/presentation/utils/localization_extension.dart';

class EmptyListBanner extends StatelessWidget {
  const EmptyListBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations;

    return InfoBanner(
      imageProvider: AssetImage(AppIcons.emptyBox),
      title: localizations.bookmarksAreEmpty,
      message: localizations.exploreMoviesToBookmark,
    );
  }
}
