import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class TCacheHelper {
  TCacheHelper._();

  static const String _productCacheKey = 'productImages';

  /// Global, shared cache manager for product images
  static final CacheManager productCacheManager = CacheManager(
    Config(
      _productCacheKey,
      stalePeriod: const Duration(days: 7), // Auto-delete after 7 days
      maxNrOfCacheObjects: 200,             // Keep only the 200 most recent items
      repo: JsonCacheInfoRepository(databaseName: _productCacheKey),
      fileService: HttpFileService(),
    ),
  );

  /// Utility to clear the entire image cache
  static Future<void> clearProductCache() async {
    await productCacheManager.emptyCache();
  }
}
