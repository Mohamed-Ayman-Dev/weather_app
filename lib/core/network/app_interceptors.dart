import 'package:dio/dio.dart';
import '../error/on_error_helper.dart';

class AppInterceptors extends Interceptor {
  final OnErrorHelper _onErrorHelper;

  AppInterceptors({required OnErrorHelper onErrorHelper})
    : _onErrorHelper = onErrorHelper;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    /// Add headers to the request
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return _onErrorHelper.onError(err, handler);
  }
}
