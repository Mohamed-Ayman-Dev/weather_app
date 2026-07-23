import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../di/locator_service.dart';
import '../network/end_points.dart';
import '../network/pretty_dio_logger.dart';
import 'no_internet_connection_page.dart';

/// Intercepts errors from Dio requests, handles token refresh and internet connection issues, and manages user session accordingly.
class OnErrorHelper {

  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final Dio retryDio = Dio()
      ///Create NEW dio instance without main interceptors to avoid infinite loop (logger interceptors only)
      ..interceptors.add(const PrettyDioLogger())
      ..options.baseUrl = EndPoints.baseUrl
      ..options.receiveDataWhenStatusError = true
      ..options.followRedirects = false;
    final options = err.requestOptions
      ..validateStatus = (s) {
        return true;
      };

    ///  handle internet error
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout) {
      debugPrint('AppInterceptors.onError: connectionError');

      final navigator = LocatorService.navigationService.currentState;
      debugPrint(
        'AppInterceptors.onError: navigating to internet connection page',
      );
      final bool? result = await navigator?.pushNamed(
        InternetConnection.routeName,
      );

      if (result == true) {
        debugPrint(
          'AppInterceptors.onError: navigating to internet connection page successful, retrying request',
        );
        final response = await retryDio.fetch(options);
        return handler.resolve(response);
      } else {
        debugPrint(
          'AppInterceptors.onError: navigating to internet connection page failed, rejecting error',
        );
        return handler.next(err);
      }
    }
    return handler.next(err);
  }
}
