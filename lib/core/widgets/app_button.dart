import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_sizes.dart';
import 'app_loader.dart';
import 'sb.dart';

enum _ButtonVariant { filled, social, compact, text }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  }) : _variant = _ButtonVariant.filled;

  const AppButton.social({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  }) : _variant = _ButtonVariant.social;

  const AppButton.compact({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  }) : _variant = _ButtonVariant.compact;

  const AppButton.text({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  }) : _variant = _ButtonVariant.text;

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? icon;
  final _ButtonVariant _variant;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final pressed = isLoading ? null : onPressed;

    switch (_variant) {
      case _ButtonVariant.filled:
        return ElevatedButton(
          onPressed: pressed,
          child: isLoading
              ? const AppLoader.button()
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      SizedBox(
                        width: AppSizes.socialIconSize.w,
                        height: AppSizes.socialIconSize.w,
                        child: icon,
                      ),
                      SB.w(AppSizes.paddingSmall.w),
                    ],
                    Text(
                      label,
                      style: text.labelLarge?.copyWith(color: colors.onPrimary),
                    ),
                  ],
                ),
        );

      case _ButtonVariant.social:
        return OutlinedButton(
          onPressed: pressed,
          child: isLoading
              ? const AppLoader.button()
              : Row(
                  children: [
                    if (icon != null)
                      SizedBox(
                        width: AppSizes.socialIconSize.w,
                        height: AppSizes.socialIconSize.w,
                        child: icon,
                      ),
                    Expanded(
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        style: text.labelMedium,
                      ),
                    ),
                    // Mirrors the icon width so the label stays centred.
                    if (icon != null) SB.w(AppSizes.socialIconSize.w),
                  ],
                ),
        );

      case _ButtonVariant.compact:
        return SizedBox(
          width: AppSizes.compactButtonWidth.w,
          height: AppSizes.compactButtonHeight.h,
          child: ElevatedButton(
            onPressed: pressed,
            child: isLoading
                ? const AppLoader.button()
                : Text(
                    label,
                    style: text.titleSmall?.copyWith(color: colors.onPrimary),
                  ),
          ),
        );

      case _ButtonVariant.text:
        return TextButton(
          onPressed: pressed,
          child: isLoading ? const AppLoader.button() : Text(label),
        );
    }
  }
}
