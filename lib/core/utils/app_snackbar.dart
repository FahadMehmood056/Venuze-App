import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/app_sizes.dart';

class AppSnackBar {
  AppSnackBar._();

  static void error(String message) => _show(
    message,
    background: Get.theme.colorScheme.error,
    foreground: Get.theme.colorScheme.onError,
  );

  static void success(String message) => _show(
    message,
    background: Get.theme.colorScheme.primary,
    foreground: Get.theme.colorScheme.onPrimary,
  );

  static void _show(
    String message, {
    required Color background,
    required Color foreground,
  }) {
    if (Get.isSnackbarOpen) Get.closeCurrentSnackbar();

    Get.rawSnackbar(
      message: message,
      backgroundColor: background,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      borderRadius: AppSizes.radiusMedium,
      margin: EdgeInsets.all(AppSizes.paddingMedium.w),
      messageText: Text(
        message,
        style: Get.textTheme.bodyMedium?.copyWith(color: foreground),
      ),
    );
  }
}
