import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../features/auth/data/datasources/auth_data_source.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/datasources/auth_secure_local_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_use_case.dart';
import '../../features/auth/domain/usecases/restore_session_use_case.dart';
import '../../features/auth/presentation/controllers/auth_session_controller.dart';
import '../network/api_client.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(ApiClient.create(), permanent: true);

    Get.put<FlutterSecureStorage>(
      const FlutterSecureStorage(),
      permanent: true,
    );

    Get.put<AuthDataSource>(
      AuthRemoteDataSource(Get.find<Dio>()),
      permanent: true,
    );

    Get.put<AuthLocalDataSource>(
      AuthSecureLocalDataSource(Get.find<FlutterSecureStorage>()),
      permanent: true,
    );

    Get.put<AuthRepository>(
      AuthRepositoryImpl(
        Get.find<AuthDataSource>(),
        Get.find<AuthLocalDataSource>(),
      ),
      permanent: true,
    );

    Get.put<LoginUseCase>(
      LoginUseCase(Get.find<AuthRepository>()),
      permanent: true,
    );

    Get.put<RestoreSessionUseCase>(
      RestoreSessionUseCase(Get.find<AuthRepository>()),
      permanent: true,
    );

    Get.put<AuthSessionController>(AuthSessionController(), permanent: true);
  }
}
