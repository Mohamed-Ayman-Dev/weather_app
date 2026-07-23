
import '../cache/cache_helper.dart';
import '../services/navigation_service.dart';
import 'locator.dart';

abstract class LocatorService {
  /// Cache
  static CacheHelper get cacheHelper => locator<CacheHelper>();

  /// Services
  static NavigationService get navigationService =>
      locator<NavigationService>();

}
