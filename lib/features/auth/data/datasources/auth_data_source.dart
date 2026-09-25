import '../models/auth_session_model.dart';

abstract class AuthDataSource {
  Future<AuthSessionModel> login({
    required String email,
    required String password,
  });
}
