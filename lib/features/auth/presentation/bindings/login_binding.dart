import 'package:get/get.dart';
import '../../domain/usecases/login_use_case.dart';
import '../controllers/auth_session_controller.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        Get.find<LoginUseCase>(),
        Get.find<AuthSessionController>(),
      ),
    );
  }
}
