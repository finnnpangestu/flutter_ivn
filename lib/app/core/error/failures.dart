abstract class Failures {
  final String message;

  const Failures(this.message);
}

class ServerFailure extends Failures {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failures {
  const NetworkFailure(super.message);
}

class UnknownFailure extends Failures {
  const UnknownFailure(super.message);
}
