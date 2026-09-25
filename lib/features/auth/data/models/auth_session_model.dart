import 'package:venuze_app/core/utils/json_reader.dart';
import 'package:venuze_app/features/auth/domain/entities/auth_session.dart';
import 'app_user_model.dart';
import 'auth_tokens_model.dart';

class AuthSessionModel {
  const AuthSessionModel({required this.user, required this.tokens});

  final AppUserModel user;
  final AuthTokensModel tokens;

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) {
    return AuthSessionModel(
      user: AppUserModel.fromJson(JsonReader.object(json['user'])),
      tokens: AuthTokensModel.fromJson(JsonReader.object(json['tokens'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {'user': user.toJson(), 'tokens': tokens.toJson()};
  }

  AuthSession toEntity() {
    return AuthSession(user: user.toEntity(), tokens: tokens.toEntity());
  }
}
