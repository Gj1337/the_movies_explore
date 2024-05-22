import 'package:flutter/material.dart';

class ScrollUpdateWidget extends StatefulWidget {
  const ScrollUpdateWidget({
    super.key,
    required this.builder,
    this.border = 100,
    this.onGetBorder,
  });

  final int border;
  final VoidCallback? onGetBorder;
  final Widget Function(ScrollController crollController) builder;

  @override
  State<ScrollUpdateWidget> createState() => _ScrollUpdateWidgetState();
}

class _ScrollUpdateWidgetState extends State<ScrollUpdateWidget> {
  final ScrollController _scrollController = ScrollController();

  bool alredyGotBorder = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(onScroll);
  }

  void onScroll() {
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentScrollPosition = _scrollController.position.pixels;

    final double scrollPercentage =
        (currentScrollPosition / maxScrollExtent) * 100;

    if (!alredyGotBorder && scrollPercentage >= widget.border) {
      alredyGotBorder = true;

      widget.onGetBorder?.call();
    }

    if (scrollPercentage <= widget.border) {
      alredyGotBorder = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_scrollController);
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }
}
