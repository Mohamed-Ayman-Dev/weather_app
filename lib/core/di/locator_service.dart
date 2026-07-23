import '../services/navigation_service.dart';
import 'locator.dart';

abstract class LocatorService {
  /// Services
  static NavigationService get navigationService =>
      locator<NavigationService>();
}
