import '../constants/app_strings.dart';
import '../errors/failure.dart';

class FailureMessage {
  FailureMessage._();

  static String resolve(Failure failure) {
    final serverMessage = failure.serverMessage?.trim();

    if (serverMessage != null && serverMessage.isNotEmpty) {
      return serverMessage;
    }

    return switch (failure.type) {
      FailureType.network => AppStrings.connectionFailed,
      FailureType.timeout => AppStrings.requestTimedOut,
      FailureType.authentication => AppStrings.invalidCredentials,
      FailureType.forbidden => AppStrings.accessDenied,
      FailureType.validation => AppStrings.checkEnteredDetails,
      FailureType.server => AppStrings.serverUnavailable,
      FailureType.request => AppStrings.invalidRequest,
      FailureType.parsing => AppStrings.invalidResponse,
      FailureType.storage => AppStrings.sessionStorageFailed,
      FailureType.unexpected => AppStrings.somethingWentWrong,
    };
  }
}
