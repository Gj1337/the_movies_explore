import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';

class BookmarkButtonWidget extends StatelessWidget {
  const BookmarkButtonWidget({
    super.key,
    this.onPressed,
    this.inBookmarks = false,
  });

  final VoidCallback? onPressed;
  final bool inBookmarks;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        inBookmarks ? bookmarkActiveImage : bookMarkDefaultImage,
        width: 24,
        height: 24,
      ),
    );
  }
}
