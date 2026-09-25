import 'package:dio/dio.dart';
import '../errors/api_exception.dart';
import '../errors/failure.dart';

class ApiErrorMapper {
  ApiErrorMapper._();

  static Failure fromDio(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure(type: FailureType.timeout);

      case DioExceptionType.connectionError:
        return const Failure(type: FailureType.network);

      case DioExceptionType.badResponse:
        return fromResponse(
          statusCode: exception.response?.statusCode,
          data: exception.response?.data,
        );

      default:
        if (exception.error is FormatException) {
          return const Failure(type: FailureType.parsing);
        }
        return const Failure(type: FailureType.unexpected);
    }
  }

  static Failure fromApi(ApiException exception) {
    return fromResponse(statusCode: exception.statusCode, data: exception.data);
  }

  static Failure fromResponse({
    required int? statusCode,
    required Object? data,
  }) {
    final message = _readMessage(data);

    final type = switch (statusCode) {
      401 || 403 => FailureType.authentication,
      422 => FailureType.validation,
      int code when code >= 500 && code < 600 => FailureType.server,
      int code when code >= 200 && code < 300 => FailureType.authentication,
      _ => FailureType.request,
    };

    return Failure(type: type, statusCode: statusCode, serverMessage: message);
  }

  static String? _readMessage(Object? data) {
    if (data is! Map) return null;

    final value = data['message'];
    if (value is! String) return null;

    final message = value.trim();
    return message.isEmpty ? null : message;
  }
}
