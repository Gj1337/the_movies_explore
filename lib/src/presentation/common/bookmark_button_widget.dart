import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
import 'package:the_movies_expore/src/presentation/utils/animation_speed.dart';

class BookmarkButtonWidget extends StatelessWidget {
  const BookmarkButtonWidget({
    super.key,
    this.onPressed,
    this.inBookmarks = false,
  });

  final VoidCallback? onPressed;
  final bool inBookmarks;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () {
          onPressed?.call();

          HapticFeedback.lightImpact();
        },
        icon: AnimatedSwitcher(
          duration: AnimationSpeed.fast.duration,
          child: SvgPicture.asset(
            key: ValueKey(inBookmarks),
            inBookmarks ? bookmarkActiveImage : bookMarkDefaultImage,
            width: 24,
            height: 24,
          ),
        ),
      );
}
