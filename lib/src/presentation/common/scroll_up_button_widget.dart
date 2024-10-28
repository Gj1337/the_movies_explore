import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
import 'package:the_movies_expore/src/presentation/utils/animation_speed.dart';

class ScrollUpButtonWrapper extends StatefulWidget {
  const ScrollUpButtonWrapper({
    required this.scrollController,
    required this.child,
    this.icon = const Icon(Icons.arrow_upward),
    this.alignment = Alignment.bottomRight,
    super.key,
    this.showButtonOffset = 500,
  });

  final Widget child;
  final ScrollController scrollController;
  final double showButtonOffset;
  final Widget icon;
  final Alignment alignment;

  @override
  State<ScrollUpButtonWrapper> createState() => _ScrollUpButtonWrapperState();
}

class _ScrollUpButtonWrapperState extends State<ScrollUpButtonWrapper> {
  bool showUpButton = false;

  @override
  void initState() {
    widget.scrollController.addListener(_onScroll);

    super.initState();
  }

  void _onScroll() {
    final passedOffset =
        widget.scrollController.offset > widget.showButtonOffset;

    if (passedOffset != showUpButton) {
      setState(() => showUpButton = !showUpButton);
    }
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: widget.alignment,
        children: [
          widget.child,
          Padding(
            padding: const EdgeInsets.all(defaultHorizontalPadding),
            child: AnimatedScale(
              scale: showUpButton ? 1 : 0,
              duration: AnimationSpeed.fast.duration,
              child: FloatingActionButton(
                onPressed: () => widget.scrollController.animateTo(
                  0,
                  duration: AnimationSpeed.normal.duration,
                  curve: Curves.linearToEaseOut,
                ),
                child: widget.icon,
              ),
            ),
          ),
        ],
      );
}
