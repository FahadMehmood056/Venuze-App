import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/sb.dart';

class CaptchaBox extends StatelessWidget {
  const CaptchaBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: AppSizes.fieldHeight.h,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusMedium.r),
          border: Border.all(
            color: AppColors.borderDefault,
            width: AppSizes.borderWidth,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: AppSizes.captchaIconSize.w,
              height: AppSizes.captchaIconSize.w,
              child: Checkbox(
                value: isChecked,
                onChanged: (value) => onChanged(value ?? false),
                activeColor: AppColors.captchaCheck,
                checkColor: AppColors.white,
                side: const BorderSide(
                  color: AppColors.borderDefault,
                  width: AppSizes.borderWidth,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusXS.r),
                ),
              ),
            ),
            SB.w(AppSizes.paddingSmall.w),
            Text(AppStrings.notARobot, style: text.bodySmall),
            const Spacer(),
            Assets.icons.recaptcha.svg(
              width: AppSizes.captchaLogoWidth.w,
              height: AppSizes.captchaLogoHeight.h,
            ),
          ],
        ),
      ),
    );
  }
}
