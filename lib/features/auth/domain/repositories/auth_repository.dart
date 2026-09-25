import 'package:dartz/dartz.dart';
import 'package:venuze_app/core/errors/failure.dart';

import '../entities/auth_session.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthSession>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthSession?>> restoreSession();
}
