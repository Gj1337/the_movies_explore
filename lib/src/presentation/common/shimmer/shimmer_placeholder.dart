import 'package:flutter/material.dart';

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => Card(
        child: SizedBox(
          width: width,
          height: height,
        ),
      );
}
