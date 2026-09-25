import 'package:dartz/dartz.dart';
import 'package:venuze_app/core/errors/failure.dart';
import '../entities/auth_session.dart';
import '../repositories/auth_repository.dart';

class RestoreSessionUseCase {
  const RestoreSessionUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, AuthSession?>> call() {
    return _repository.restoreSession();
  }
}
