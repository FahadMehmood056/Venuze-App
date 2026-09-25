class AuthTokens {
  const AuthTokens({
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

  bool isAccessExpiredAt(DateTime time) => !accessTokenExpiresAt.isAfter(time);

  bool isRefreshExpiredAt(DateTime time) =>
      !refreshTokenExpiresAt.isAfter(time);
}
