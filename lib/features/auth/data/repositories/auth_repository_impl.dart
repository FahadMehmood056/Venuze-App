import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/api_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/storage_exception.dart';
import '../../../../core/network/api_error_mapper.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_data_source.dart';
import '../datasources/auth_local_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._authDataSource, this._localDataSource);

  final AuthDataSource _authDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, AuthSession>> login({
    required String email,
    required String password,
  }) async {
    try {
      final session = await _authDataSource.login(
        email: email.trim(),
        password: password,
      );

      await _localDataSource.saveSession(session);

      return Right(session.toEntity());
    } on DioException catch (exception) {
      return Left(ApiErrorMapper.fromDio(exception));
    } on ApiException catch (exception) {
      return Left(ApiErrorMapper.fromApi(exception));
    } on StorageException {
      return const Left(Failure(type: FailureType.storage));
    } on FormatException {
      return const Left(Failure(type: FailureType.parsing));
    }
  }

  @override
  Future<Either<Failure, AuthSession?>> restoreSession() async {
    try {
      final storedSession = await _localDataSource.readSession();

      if (storedSession == null) {
        return const Right(null);
      }

      final session = storedSession.toEntity();

      if (session.tokens.isAccessExpiredAt(DateTime.now().toUtc())) {
        await _localDataSource.clearSession();
        return const Right(null);
      }

      return Right(session);
    } on StorageException {
      return const Left(Failure(type: FailureType.storage));
    } on FormatException {
      return const Left(Failure(type: FailureType.parsing));
    }
  }
}
