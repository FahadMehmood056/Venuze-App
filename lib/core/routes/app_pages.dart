import 'package:get/get.dart';
import '../../features/auth/presentation/bindings/login_binding.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/main/presentation/bindings/main_binding.dart';
import '../../features/main/presentation/pages/main_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
  ];
}
