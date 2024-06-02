import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
import 'package:the_movies_expore/src/presentation/utils/animation_speed.dart';

class ScrollUpButtonWidget extends StatefulWidget {
  const ScrollUpButtonWidget({
    super.key,
    required this.scrollController,
    required this.child,
    this.showButtonOffset = 500,
  });

  final Widget child;
  final ScrollController scrollController;
  final double showButtonOffset;

  @override
  State<ScrollUpButtonWidget> createState() => _ScrollUpButtonWidgetState();
}

class _ScrollUpButtonWidgetState extends State<ScrollUpButtonWidget> {
  bool showUpButton = false;

  @override
  void initState() {
    widget.scrollController.addListener(_onScroll);

    super.initState();
  }

  void _onScroll() {
    if (widget.scrollController.offset > widget.showButtonOffset &&
        !showUpButton) {
      setState(() {
        showUpButton = true;
      });
    } else if (widget.scrollController.offset < widget.showButtonOffset &&
        showUpButton) {
      setState(() {
        showUpButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Container(
          padding: const EdgeInsets.all(defaultHorizontalPadding),
          alignment: Alignment.bottomRight,
          child: AnimatedScale(
            scale: showUpButton ? 1 : 0,
            duration: AnimationSpeed.fast.duration,
            child: FloatingActionButton(
              onPressed: () => widget.scrollController.animateTo(0,
                  duration: AnimationSpeed.normal.duration,
                  curve: Curves.linearToEaseOut),
              child: const Icon(Icons.arrow_upward),
            ),
          ),
        )
      ],
    );
  }
}
