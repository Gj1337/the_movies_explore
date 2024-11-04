import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/presentation/common/app_icons.dart';
import 'package:the_movies_expore/src/presentation/common/info_banner.dart';
import 'package:the_movies_expore/src/presentation/utils/localization_extension.dart';

class SomethingWentWrongBanner extends StatelessWidget {
  const SomethingWentWrongBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;

    return InfoBanner(
      imageProvider: AssetImage(AppIcons.warning),
      title: localization.somethingWentWrong,
    );
  }
}
