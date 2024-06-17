import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:the_movies_expore/src/presentation/utils/animation_speed.dart';
import 'package:the_movies_expore/src/presentation/utils/non_storing_cache_manager.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    required this.imageUrl,
    super.key,
    this.memCacheWidth,
    this.isCaching = false,
  });

  final String imageUrl;
  final bool isCaching;

  final int? memCacheWidth;

  @override
  Widget build(BuildContext context) => Card(
        color: Theme.of(context).colorScheme.surface,
        child: CachedNetworkImage(
          cacheManager:
              isCaching ? DefaultCacheManager() : NonStoringCacheManager(),
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          memCacheWidth: memCacheWidth,
          fadeOutDuration: AnimationSpeed.fast.duration,
          fadeInDuration: AnimationSpeed.fast.duration,
        ),
      );
}
