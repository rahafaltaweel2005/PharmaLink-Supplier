import 'package:dio/dio.dart';

class ApiExceptions {
  ApiExceptions._();

  static Exception handle(dynamic error) {
    if (error is DioException) {
      return Exception(_handleDioException(error));
    }
    return Exception(error.toString());
  }

  static String _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please try again.';
      case DioExceptionType.sendTimeout:
        return 'Send timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout. Please try again.';
      case DioExceptionType.badCertificate:
        return 'Bad certificate.';
      case DioExceptionType.badResponse:
        return _handleBadResponse(error);
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'No internet connection or server is not reachable.';
      case DioExceptionType.unknown:
        return 'Something went wrong. Please try again.';
    }
  }
}

String _handleBadResponse(DioException error) {
  final statusCode = error.response?.statusCode;
  final responseData = error.response?.data;
  if (responseData is Map<String, dynamic>) {
    final message = responseData['message'];
    if (message != null && message.toString().isNotEmpty) {
      return message.toString();
    }
  }
  switch (statusCode) {
    case 200:
      return 'Success';

    case 400:
      return 'Bad request.';

    case 401:
      return 'Unauthorized. Please login again.';

    case 404:
      return 'API endpoint not found.';

    case 422:
      return 'Validation error.';

    case 500:
      return 'Server error. Please try again later.';

    default:
      return 'Something went wrong. Please try again.';
  }
}
