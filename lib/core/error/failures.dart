// failures.dart
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure { const ServerFailure(String m): super(m); }
class UnauthorizedFailure extends Failure { const UnauthorizedFailure(String m): super(m); }
class NotFoundFailure extends Failure { const NotFoundFailure(String m): super(m); }
class RateLimitFailure extends Failure { const RateLimitFailure(String m): super(m); }
class ValidationFailure extends Failure { const ValidationFailure(String m): super(m); }
class NetworkFailure extends Failure { const NetworkFailure(String m): super(m); }
class TimeoutFailure extends Failure { const TimeoutFailure(String m): super(m); }
