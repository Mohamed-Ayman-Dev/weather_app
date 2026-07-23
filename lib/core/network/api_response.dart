import 'package:weather_app/core/network/status_code.dart';

import '../error/exceptions.dart';


class ApiResponse {
  final dynamic responseData;
  final int? statusCode;

  ApiResponse({required this.responseData, required this.statusCode});

  bool get ok =>
      (statusCode == StatusCode.ok || statusCode == StatusCode.created);

  dynamic get data =>
      responseData ??
      {'message': "Something went wrong", 'result': false};

  String get errorMessage => data['message'] ?? data['msg'];

  T dataOrThrow<T>(T Function(dynamic data) parse) {
    try {
      return parse(data);
    } catch (e, stackTrace) {
      throw ApiException(
        message:
            "${"Something went wrong"} - Parsing Error: ${e.toString()}",
        data: responseData,
      );
    }
  }

  @override
  String toString() {
    return 'ApiResponse(responseData: $responseData, statusCode: $statusCode)';
  }
}
