import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../gen/fonts.gen.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextTheme get textTheme => TextTheme(
    headlineMedium: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: 26.sp,
      fontWeight: FontWeight.w600,
      height: 28 / 26,
      color: AppColors.textPrimary,
    ),

    titleLarge: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),

    titleSmall: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.42,
    ),

    bodyLarge: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: 24 / 14,
      color: AppColors.textPrimary,
    ),

    bodyMedium: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: 21 / 14,
      color: AppColors.textSecondary,
    ),

    bodySmall: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      height: 1,
      color: AppColors.textPrimary,
    ),

    labelLarge: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      height: 24 / 16,
    ),

    labelMedium: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),

    labelSmall: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      height: 1,
    ),
  );
}
