class ApiException implements Exception {
  const ApiException({required this.statusCode, required this.data});

  final int? statusCode;
  final Object? data;

  @override
  String toString() => 'ApiException(statusCode: $statusCode)';
}
