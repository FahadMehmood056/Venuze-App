import 'package:venuze_app/core/utils/json_reader.dart';
import 'package:venuze_app/features/auth/domain/entities/auth_tokens.dart';

class AuthTokensModel {
  const AuthTokensModel({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.accessTokenExpiresAt,
    required this.refreshTokenExpiresAt,
  });

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final DateTime accessTokenExpiresAt;
  final DateTime refreshTokenExpiresAt;

  factory AuthTokensModel.fromJson(Map<String, dynamic> json) {
    return AuthTokensModel(
      accessToken: JsonReader.nonEmptyString(json, 'access_token'),
      refreshToken: JsonReader.nonEmptyString(json, 'refresh_token'),
      tokenType: JsonReader.nonEmptyString(json, 'token_type'),
      accessTokenExpiresAt: JsonReader.dateTime(
        json,
        'access_token_expires_at',
      ),
      refreshTokenExpiresAt: JsonReader.dateTime(
        json,
        'refresh_token_expires_at',
      ),
    );
  }

  factory AuthTokensModel.fromEntity(AuthTokens entity) {
    return AuthTokensModel(
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
      tokenType: entity.tokenType,
      accessTokenExpiresAt: entity.accessTokenExpiresAt,
      refreshTokenExpiresAt: entity.refreshTokenExpiresAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'token_type': tokenType,
      'access_token_expires_at': accessTokenExpiresAt.toUtc().toIso8601String(),
      'refresh_token_expires_at': refreshTokenExpiresAt
          .toUtc()
          .toIso8601String(),
    };
  }

  AuthTokens toEntity() {
    return AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      accessTokenExpiresAt: accessTokenExpiresAt,
      refreshTokenExpiresAt: refreshTokenExpiresAt,
    );
  }
}
