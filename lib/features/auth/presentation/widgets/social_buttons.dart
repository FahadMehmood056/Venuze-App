import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venuze_app/core/constants/app_sizes.dart';
import 'package:venuze_app/core/constants/app_strings.dart';
import 'package:venuze_app/core/gen/assets.gen.dart';
import 'package:venuze_app/core/widgets/app_button.dart';
import 'package:venuze_app/core/widgets/sb.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
    required this.onFacebook,
    required this.onGoogle,
    required this.onApple,
  });

  final VoidCallback onFacebook;
  final VoidCallback onGoogle;
  final VoidCallback onApple;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton.social(
          label: AppStrings.loginWithFacebook,
          icon: Assets.icons.facebook.svg(),
          onPressed: onFacebook,
        ),
        SB.h(AppSizes.gapBetweenSocial.h),
        AppButton.social(
          label: AppStrings.loginWithGoogle,
          icon: Assets.icons.google.svg(),
          onPressed: onGoogle,
        ),
        SB.h(AppSizes.gapBetweenSocial.h),
        AppButton.social(
          label: AppStrings.loginWithApple,
          icon: Assets.icons.apple.svg(),
          onPressed: onApple,
        ),
      ],
    );
  }
}
