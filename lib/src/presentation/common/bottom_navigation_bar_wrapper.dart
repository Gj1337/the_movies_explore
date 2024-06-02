import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
import 'package:the_movies_expore/src/presentation/utils/animation_speed.dart';

class BottomNavigationBarWrapper extends StatelessWidget {
  const BottomNavigationBarWrapper({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    final currentIndex = child.currentIndex;

    final items = [
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(homeActiveImage),
        icon: SvgPicture.asset(homeDefaultImage),
        label: '',
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(searchActiveImage),
        icon: SvgPicture.asset(searchDeafultImage),
        label: '',
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(bookmarkActiveImage),
        icon: SvgPicture.asset(bookMarkDefaultImage),
        label: '',
      ),
    ];

    return Scaffold(
      body: AnimatedSwitcher(
        duration: AnimationSpeed.normal.duration,
        layoutBuilder: (currentChild, previousChildren) =>
            currentChild ?? previousChildren.last,
        child: SizedBox(
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
