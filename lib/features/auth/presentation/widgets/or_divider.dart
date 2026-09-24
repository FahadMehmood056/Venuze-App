import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXXL.w),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.borderDefault,
              thickness: AppSizes.borderWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingSmall.w),
            child: Text(AppStrings.orContinueWith, style: text.bodyMedium),
          ),
          const Expanded(
            child: Divider(
              color: AppColors.borderDefault,
              thickness: AppSizes.borderWidth,
            ),
          ),
        ],
      ),
    );
  }
}
