// exceptions.dart
class ServerException implements Exception {
  final String message;
  ServerException([this.message = "Server error"]);
  @override
  String toString() => "ServerException: $message";
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException([this.message = "Unauthorized"]);
  @override
  String toString() => "UnauthorizedException: $message";
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException([this.message = "Not Found"]);
  @override
  String toString() => "NotFoundException: $message";
}

class RateLimitException implements Exception {
  final String message;
  RateLimitException([this.message = "Rate limit exceeded"]);
  @override
  String toString() => "RateLimitException: $message";
}

class ValidationException implements Exception {
  final String message;
  ValidationException([this.message = "Validation failed"]);
  @override
  String toString() => "ValidationException: $message";
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = "No Internet connection"]);
  @override
  String toString() => "NetworkException: $message";
}

class TimeoutException implements Exception {
  final String message;
  TimeoutException([this.message = "Request timeout"]);
  @override
  String toString() => "TimeoutException: $message";
}
