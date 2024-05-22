import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_expore/src/movies_app.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';

class BottomNavigationBarWrapper extends StatelessWidget {
  const BottomNavigationBarWrapper({
    super.key,
    required this.child,
    this.path,
  });

  final Widget child;
  final String? path;

  @override
  Widget build(BuildContext context) {
    final int currentIndex;

    {
      final realPath = path ?? '';

      if (realPath.endsWith(Routes.mainScreen.path)) {
        currentIndex = 0;
      } else if (realPath.endsWith(Routes.searchScreen.path)) {
        currentIndex = 1;
      } else if (realPath.endsWith(Routes.bookmarksScreen.path)) {
        currentIndex = 2;
      } else {
        currentIndex = 0;
      }

      final items = [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              currentIndex == 0 ? homeActiveImage : homeDefaultImage),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              currentIndex == 1 ? searchActiveImage : searchDeafultImage),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              currentIndex == 2 ? bookmarkActiveImage : bookMarkDefaultImage),
          label: '',
        ),
      ];

      onTap(index) {
        switch (index) {
          case 0:
            context.goNamed(Routes.mainScreen.name);
          case 1:
            context.goNamed(Routes.searchScreen.name);
          case 2:
            context.goNamed(Routes.bookmarksScreen.name);
        }
      }

      return SafeArea(
        top: false,
        left: false,
        right: false,
        child: ColoredBox(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Expanded(child: child),
              BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: items,
                currentIndex: currentIndex,
                onTap: onTap,
              ),
            ],
          ),
        ),
      );
    }
  }
}
