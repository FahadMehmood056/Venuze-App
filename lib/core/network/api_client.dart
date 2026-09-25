import 'package:dio/dio.dart';
import 'package:venuze_app/core/constants/api_constants.dart';

class ApiClient {
  ApiClient._();

  static Dio create() {
    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        sendTimeout: ApiConstants.sendTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        responseType: ResponseType.json,
        headers: const {'Accept': 'application/json'},
      ),
    );
  }
}
