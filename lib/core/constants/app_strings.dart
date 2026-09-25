class AppStrings {
  AppStrings._();

  static const String appName = 'Venuze';

  static const String logIn = 'Log in';
  static const String noAccount = "Don't have account Yet? ";
  static const String signUp = 'Sign up';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String forgotPassword = 'Forgot Password?';
  static const String notARobot = "I'm not a robot";
  static const String captchaRequired = "Please confirm you're not a robot";
  static const String login = 'Login';
  static const String orContinueWith = 'or continue with';
  static const String loginWithFacebook = 'Log in with Facebook';
  static const String loginWithGoogle = 'Log in with Google';
  static const String loginWithApple = 'Log in with Apple';

  static const String noBookingsFound = 'No bookings found';
  static const String bookingsSubtitle =
      'Log in or sign up to begin your journey.';
  static const String signIn = 'Sign in';
  static const String home = 'Home';
  static const String explore = 'Explore';
  static const String bookings = 'Bookings';
  static const String profile = 'Profile';

  static const String emailRequired = 'Email is required';
  static const String emailInvalid = 'Enter a valid email';
  static const String passwordRequired = 'Password is required';
  static const String passwordTooShort =
      'Password must be at least 6 characters';

  static const String noInternet = 'No internet connection';
  static const String somethingWentWrong = 'Something went wrong';

  static const String notifications = 'Notifications';
  static const String noUnreadNotifications = 'No unread notifications';

  static String unreadNotifications(int count) => '$count unread notifications';

  static String notificationBadgeLabel(int count) =>
      count > 9 ? '9+' : '$count';

  static const String connectionFailed =
      'Unable to connect. Check your connection and try again.';
  static const String requestTimedOut =
      'The request timed out. Please try again.';
  static const String invalidCredentials = 'Incorrect email or password';
  static const String sessionExpired =
      'Your session has expired. Please sign in again.';
  static const String accessDenied =
      'You do not have permission to perform this action.';
  static const String tooManyRequests =
      'Too many attempts. Please try again later.';
  static const String serverUnavailable =
      'The server is unavailable. Please try again later.';
  static const String invalidRequest = 'The request could not be completed.';
  static const String invalidResponse =
      'The server returned an unexpected response. Please try again.';
  static const String secureConnectionFailed =
      'Unable to establish a secure connection.';
  static const String sessionStorageFailed =
      'Unable to save or restore your session. Please try again.';
  static const String requestCancelled = 'Request cancelled.';
  static const String checkEnteredDetails =
      'Please check the details you entered.';
}
