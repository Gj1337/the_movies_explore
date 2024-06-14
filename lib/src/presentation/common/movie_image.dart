import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/presentation/utils/animation_speed.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.imageUrl,
    this.memCacheWidth,
  });

  final String imageUrl;

  final int? memCacheWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        memCacheWidth: memCacheWidth,
        fadeOutDuration: AnimationSpeed.fast.duration,
        fadeInDuration: AnimationSpeed.fast.duration,
      ),
    );
  }
}
