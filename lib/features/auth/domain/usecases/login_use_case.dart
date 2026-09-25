import 'package:dartz/dartz.dart';
import 'package:venuze_app/core/errors/failure.dart';
import '../entities/auth_session.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  const LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, AuthSession>> call({
    required String email,
    required String password,
  }) {
    return _repository.login(email: email, password: password);
  }
}
