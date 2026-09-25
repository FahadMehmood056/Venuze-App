class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://backend.venuze.com/';
  static const String login = 'api/auth/login';

  static const Duration connectTimeout = Duration(seconds: 20);
  static const Duration sendTimeout = Duration(seconds: 20);
  static const Duration receiveTimeout = Duration(seconds: 20);
}
