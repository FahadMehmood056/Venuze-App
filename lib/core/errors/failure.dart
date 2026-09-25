enum FailureType {
  network,
  timeout,
  authentication,
  forbidden,
  validation,
  server,
  request,
  parsing,
  storage,
  unexpected,
}

class Failure {
  const Failure({required this.type, this.statusCode, this.serverMessage});

  final FailureType type;
  final int? statusCode;
  final String? serverMessage;
}
