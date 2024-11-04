import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';

import 'package:the_movies_expore/src/presentation/utils/shaking_wrapper.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({
    required this.imageProvider,
    required this.title,
    this.message,
    super.key,
  });

  final ImageProvider imageProvider;
  final String title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final message = this.message;

    return SizedBox(
      width: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShakingWrapper(
            child: Image(
              image: imageProvider,
              height: 150,
              width: 150,
            ),
          ),
          Text(
            title,
            style: AppFonts.bannerTitle,
          ),
          if (message != null)
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppFonts.genreMovie,
            ),
        ],
      ),
    );
  }
}
