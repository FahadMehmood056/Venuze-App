import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venuze_app/features/auth/presentation/widgets/social_buttons.dart';
import 'package:venuze_app/features/auth/presentation/widgets/text_with_action.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/sb.dart';
import '../widgets/captcha_box.dart';
import '../widgets/or_divider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isRobotChecked = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            AppSizes.horizontalPadding.w,
            AppSizes.topPadding.h,
            AppSizes.horizontalPadding.w,
            AppSizes.paddingXL.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.images.logo.image(
                width: AppSizes.logoWidth.w,
                height: AppSizes.logoHeight.h,
              ),
              SB.h(AppSizes.gapLogoToHeading.h),
              Text(AppStrings.logIn, style: text.headlineMedium),
              SB.h(AppSizes.gapHeadingToSubtitle.h),
              TextWithAction(
                text: AppStrings.noAccount,
                actionLabel: AppStrings.signUp,
                onActionTap: () {},
              ),
              SB.h(AppSizes.gapSubtitleToField.h),
              AppTextField(
                controller: _emailController,
                hint: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SB.h(AppSizes.fieldGap.h),
              AppTextField.password(
                controller: _passwordController,
                hint: AppStrings.password,
              ),
              SB.h(AppSizes.gapFieldToForgot.h),
              Align(
                alignment: Alignment.centerRight,
                child: AppButton.text(
                  onPressed: () {},
                  label: AppStrings.forgotPassword,
                ),
              ),
              SB.h(AppSizes.gapForgotToCaptcha.h),
              CaptchaBox(
                isChecked: _isRobotChecked,
                onChanged: (value) => setState(() => _isRobotChecked = value),
              ),
              SB.h(AppSizes.gapCaptchaToButton.h),
              AppButton(
                label: AppStrings.login,
                onPressed: _isRobotChecked
                    ? () => Get.offAllNamed(AppRoutes.main)
                    : null,
              ),
              SB.h(AppSizes.gapButtonToDivider.h),
              const OrDivider(),
              SB.h(AppSizes.gapButtonFromDivider.h),
              SocialButtons(onFacebook: () {}, onGoogle: () {}, onApple: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
