import 'package:dio/dio.dart';
import 'package:venuze_app/core/constants/api_constants.dart';
import 'package:venuze_app/core/errors/api_exception.dart';
import 'package:venuze_app/core/utils/json_reader.dart';
import '../models/auth_session_model.dart';
import 'auth_data_source.dart';

class AuthRemoteDataSource implements AuthDataSource {
  const AuthRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<AuthSessionModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post<Object?>(
      ApiConstants.login,
      data: FormData.fromMap({'email': email, 'password': password}),
    );

    final json = JsonReader.object(response.data);

    if (!JsonReader.boolean(json, 'success')) {
      throw ApiException(statusCode: response.statusCode, data: json);
    }

    return AuthSessionModel.fromJson(JsonReader.object(json['data']));
  }
}
