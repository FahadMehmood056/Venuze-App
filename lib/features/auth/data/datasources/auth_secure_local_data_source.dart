import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:venuze_app/core/constants/storage_keys.dart';
import 'package:venuze_app/core/errors/storage_exception.dart';
import 'package:venuze_app/core/utils/json_reader.dart';
import '../models/auth_session_model.dart';
import 'auth_local_data_source.dart';

class AuthSecureLocalDataSource implements AuthLocalDataSource {
  const AuthSecureLocalDataSource(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<void> saveSession(AuthSessionModel session) async {
    final encoded = jsonEncode(session.toJson());

    try {
      await _storage.write(key: StorageKeys.authSession, value: encoded);
    } on PlatformException {
      throw const StorageException();
    }
  }

  @override
  Future<AuthSessionModel?> readSession() async {
    final String? encoded;

    try {
      encoded = await _storage.read(key: StorageKeys.authSession);
    } on PlatformException {
      throw const StorageException();
    }

    if (encoded == null) return null;

    try {
      final decoded = jsonDecode(encoded);

      return AuthSessionModel.fromJson(JsonReader.object(decoded));
    } on FormatException {
      await clearSession();
      return null;
    }
  }

  @override
  Future<void> clearSession() async {
    try {
      await _storage.delete(key: StorageKeys.authSession);
    } on PlatformException {
      throw const StorageException();
    }
  }
}
