import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_expore/src/presentation/common/app_icons.dart';
import 'package:the_movies_expore/src/presentation/utils/animation_speed.dart';

class BottomNavigationBarWrapper extends StatelessWidget {
  const BottomNavigationBarWrapper({
    required this.child,
    super.key,
  });

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    final currentIndex = child.currentIndex;

    final items = [
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(AppIcons.homeActiveImage),
        icon: SvgPicture.asset(AppIcons.homeDefaultImage),
        label: '',
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(AppIcons.searchActiveImage),
        icon: SvgPicture.asset(AppIcons.searchDeafultImage),
        label: '',
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(AppIcons.bookmarkActiveImage),
        icon: SvgPicture.asset(AppIcons.bookMarkDefaultImage),
        label: '',
      ),
    ];

    return Scaffold(
      body: AnimatedSwitcher(
        duration: AnimationSpeed.normal.duration,
        layoutBuilder: (currentChild, previousChildren) =>
            currentChild ?? previousChildren.last,
        child: KeyedSubtree(
          key: ValueKey(child.currentIndex),
          child: child,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: items,
        currentIndex: currentIndex,
        onTap: child.goBranch,
      ),
    );
  }
}
