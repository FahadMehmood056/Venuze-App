import 'package:get/get.dart';
import 'package:venuze_app/features/auth/domain/entities/app_user.dart';

class AuthSessionController extends GetxController {
  final _user = Rxn<AppUser>();

  AppUser? get user => _user.value;

  bool get isAuthenticated => _user.value != null;

  void setUser(AppUser user) {
    _user.value = user;
  }

  void clearUser() {
    _user.value = null;
  }
}
