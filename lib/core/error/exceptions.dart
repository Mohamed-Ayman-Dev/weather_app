import 'dart:convert';

import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  const ApiException({required this.message, this.statusCode, this.data});

  /// if status code is null means ( no internet connection or timeout ... ), fallback to cache
  bool get shouldFallbackToCache => statusCode == null;

  factory ApiException.fromDioException(DioException exception) {
    final statusCode = exception.response?.statusCode;
    final responseData = _decode(exception.response?.data);

    return ApiException(
      message: _extractMessage(exception, responseData),
      statusCode: statusCode,
      data: responseData,
    );
  }

  static dynamic _decode(dynamic data) {
    if (data is String) {
      try {
        return jsonDecode(data);
      } catch (_) {
        return data;
      }
    }
    return data;
  }

  static String _extractMessage(DioException exception, dynamic responseData) {
    if (responseData is Map<String, dynamic>) {
      final backendMessage =
          responseData['message'] ??
          responseData['msg'] ??
          responseData['error']?['message'];

      if (backendMessage is String && backendMessage.isNotEmpty) {
        return backendMessage;
      }
    }

    switch (exception.type) {
      case DioExceptionType.connectionError:
        return 'No internet connection.';

      case DioExceptionType.connectionTimeout:
        return 'Connection timeout.';

      case DioExceptionType.receiveTimeout:
        return 'Receive timeout.';

      case DioExceptionType.sendTimeout:
        return 'Send timeout.';

      case DioExceptionType.cancel:
        return 'Request cancelled.';

      case DioExceptionType.badResponse:
        return exception.message ?? 'Request failed.';
      default:
        return 'Something went wrong.';
    }
  }

  @override
  String toString() =>
      'ApiException(statusCode: $statusCode, message: $message)';
}
