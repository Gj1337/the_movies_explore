import 'package:flutter/material.dart';

class ScrollUpdateWidget extends StatefulWidget {
  const ScrollUpdateWidget({
    required this.builder,
    super.key,
    this.border = 100,
    this.onGetBorder,
    this.scrollController,
  });

  final int border;
  final VoidCallback? onGetBorder;
  final Widget Function(ScrollController crollController) builder;
  final ScrollController? scrollController;

  @override
  State<ScrollUpdateWidget> createState() => _ScrollUpdateWidgetState();
}

class _ScrollUpdateWidgetState extends State<ScrollUpdateWidget> {
  late final ScrollController _scrollController;

  bool alredyGotBorder = false;

  @override
  void initState() {
    super.initState();

    _scrollController = widget.scrollController ?? ScrollController();

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
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
  Widget build(BuildContext context) => widget.builder(_scrollController);

  @override
  void dispose() {
    if (widget.scrollController == null) _scrollController.dispose();

    super.dispose();
  }
}
