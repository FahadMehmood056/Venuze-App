import 'package:get/get.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/usecases/login_use_case.dart';
import 'auth_session_controller.dart';

class LoginController extends GetxController {
  LoginController(this._login, this._sessionController);

  final LoginUseCase _login;
  final AuthSessionController _sessionController;

  final _isLoading = false.obs;
  final _isRobotChecked = false.obs;

  bool get isLoading => _isLoading.value;

  bool get isRobotChecked => _isRobotChecked.value;

  bool get canSubmit => !_isLoading.value;

  Failure? failure;

  void setRobotChecked(bool value) => _isRobotChecked.value = value;

  Future<bool> login({required String email, required String password}) async {
    if (isClosed || _isLoading.value) return false;

    _isLoading.value = true;
    failure = null;

    try {
      final result = await _login(email: email, password: password);

      if (isClosed) return false;

      return result.fold(
        (error) {
          failure = error;
          return false;
        },
        (session) {
          _sessionController.setUser(session.user);
          return true;
        },
      );
    } finally {
      if (!isClosed) {
        _isLoading.value = false;
      }
    }
  }
}
