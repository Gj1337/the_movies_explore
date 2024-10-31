import 'dart:math';

import 'package:flutter/material.dart';

class ShakingWrapper extends StatefulWidget {
  const ShakingWrapper({
    required this.child,
    this.duration = const Duration(milliseconds: 1250),
    this.amplitude = 1 / 100,
    super.key,
  });

  final Widget child;
  final Duration? duration;

  ///Amplitude of rotatin, where 1 is full rotation
  final double amplitude;

  @override
  State<ShakingWrapper> createState() => _ShakingWrapperState();
}

class _ShakingWrapperState extends State<ShakingWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    final rotateValue = widget.amplitude * 2 * pi;

    _animation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: -rotateValue),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: -rotateValue, end: 0),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: rotateValue),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: rotateValue, end: 0),
        weight: 1,
      ),
    ]).animate(_controller);

    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Transform.rotate(
          angle: _animation.value,
          child: widget.child,
        ),
        child: widget.child,
      );
}
