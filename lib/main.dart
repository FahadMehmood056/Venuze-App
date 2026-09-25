import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venuze_app/app.dart';
import 'package:venuze_app/core/bindings/initial_binding.dart';
import 'package:venuze_app/core/routes/app_routes.dart';
import 'package:venuze_app/features/auth/domain/usecases/restore_session_use_case.dart';
import 'package:venuze_app/features/auth/presentation/controllers/auth_session_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBinding().dependencies();

  final sessionController = Get.find<AuthSessionController>();
  final restoreSession = Get.find<RestoreSessionUseCase>();
  final result = await restoreSession();

  final initialRoute = result.fold(
    (failure) {
      sessionController.clearUser();
      return AppRoutes.login;
    },
    (session) {
      if (session == null) {
        sessionController.clearUser();
        return AppRoutes.login;
      }

      sessionController.setUser(session.user);
      return AppRoutes.main;
    },
  );

  runApp(VenuzeApp(initialRoute: initialRoute));
}
