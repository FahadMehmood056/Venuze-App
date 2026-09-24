import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_sizes.dart';
import '../gen/fonts.gen.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    fontFamily: FontFamily.poppins,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: AppTextStyles.textTheme,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.buttonText,
      surface: AppColors.white,
      onSurface: AppColors.textPrimary,
      error: AppColors.error,
      onError: AppColors.white,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      constraints: BoxConstraints(
        minHeight: AppSizes.fieldHeight.h,
        maxHeight: AppSizes.fieldHeight.h,
      ),
      isDense: true,
      hintStyle: AppTextStyles.textTheme.bodyLarge?.copyWith(
        color: AppColors.textHint,
      ),
      border: _border(AppColors.borderDefault),
      enabledBorder: _border(AppColors.borderDefault),
      focusedBorder: _border(AppColors.borderFocused),
      errorBorder: _border(AppColors.error),
      focusedErrorBorder: _border(AppColors.error),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.buttonText,
        disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.6),
        elevation: 0,
        minimumSize: Size.fromHeight(AppSizes.buttonHeight.h),
        textStyle: AppTextStyles.textTheme.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMedium.r),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        minimumSize: Size.fromHeight(AppSizes.socialButtonHeight.h),
        textStyle: AppTextStyles.textTheme.labelMedium,
        side: const BorderSide(
          color: AppColors.borderSocial,
          width: AppSizes.borderWidth,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusSocial.r),
        ),
      ),
    ),

    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.textHint,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        highlightColor: Colors.transparent,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        overlayColor: Colors.transparent,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: AppTextStyles.textTheme.labelSmall,
      ),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
    ),
  );

  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSizes.radiusMedium.r),
    borderSide: BorderSide(color: color, width: AppSizes.borderWidth),
  );
}
