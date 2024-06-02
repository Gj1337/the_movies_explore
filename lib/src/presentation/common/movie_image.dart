import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.imageUrl,
    this.memCacheHeight,
    this.memCacheWidth,
  });

  final String imageUrl;
  final int? memCacheHeight;
  final int? memCacheWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        memCacheHeight: memCacheHeight,
        memCacheWidth: memCacheWidth,
      ),
    );
  }
}
