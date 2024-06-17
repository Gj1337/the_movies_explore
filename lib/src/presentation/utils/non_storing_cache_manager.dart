import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Cache manager implementation, which without storing data,
/// each time it will try upload image from the internet.
final class NonStoringCacheManager extends CacheManager {
  static const key = 'libCachedImageData';

  static final NonStoringCacheManager _instance = NonStoringCacheManager._();

  factory NonStoringCacheManager() => _instance;

  NonStoringCacheManager._()
      : super(Config(key, repo: NonStoringObjectProvider()));
}
