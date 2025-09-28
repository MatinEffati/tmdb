import 'package:dio/dio.dart';
import '../error/exceptions.dart';

class ErrorHandler {
  static Exception handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkException("No Internet Connection.");

      case DioExceptionType.badResponse:
        final res = error.response;
        if (res != null) return fromResponse(res);
        return ServerException(error.message ?? "Bad response");

      case DioExceptionType.badCertificate:
        return ServerException("Bad certificate");

      case DioExceptionType.cancel:
        return ServerException("Request cancelled");

      case DioExceptionType.unknown:
      default:
        return ServerException(error.message ?? "Unknown Dio error");
    }
  }

  static Exception fromResponse(Response response) {
    final httpStatus = response.statusCode ?? 500;
    String message = response.statusMessage ?? 'Unknown';
    int? statusCode;

    try {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        message = data['status_message'] ?? message;
        statusCode = data['status_code'];
      }
    } catch (_) {}

    switch (httpStatus) {
      case 400:
        return ValidationException(message);
      case 401:
        return UnauthorizedException(message);
      case 403:
        return UnauthorizedException(message);
      case 404:
        return NotFoundException(message);
      case 422:
        return ValidationException(message);
      case 429:
        return RateLimitException(message);
      case 500:
      case 502:
      case 503:
      case 504:
        return ServerException(message);
      default:
        if (statusCode == 7) {
          return UnauthorizedException("Invalid API key: $message");
        }
        return ServerException(message);
    }
  }
}
