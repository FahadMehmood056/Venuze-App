import '../constants/app_strings.dart';

class Validators {
  Validators._();

  static final RegExp _emailPattern = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

  static String? email(String? value) {
    final email = value?.trim() ?? '';

    if (email.isEmpty) return AppStrings.emailRequired;

    if (!_emailPattern.hasMatch(email)) {
      return AppStrings.emailInvalid;
    }

    return null;
  }

  static String? loginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }

    if (value.length < 6) {
      return AppStrings.passwordTooShort;
    }

    return null;
  }
}
