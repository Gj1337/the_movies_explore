import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/presentation/common/app_icons.dart';
import 'package:the_movies_expore/src/presentation/common/info_banner.dart';
import 'package:the_movies_expore/src/presentation/utils/localization_extension.dart';

class EnterMovieTitleBanner extends StatelessWidget {
  const EnterMovieTitleBanner({super.key});

  @override
  Widget build(BuildContext context) => InfoBanner(
        imageProvider: AssetImage(AppIcons.typing),
        title: context.localizations.enterMovieTitle,
      );
}
