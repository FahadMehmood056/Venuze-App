import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venuze_app/core/constants/app_sizes.dart';
import 'package:venuze_app/core/constants/app_strings.dart';
import 'package:venuze_app/core/gen/assets.gen.dart';
import 'package:venuze_app/core/routes/app_routes.dart';
import 'package:venuze_app/core/utils/app_snackbar.dart';
import 'package:venuze_app/core/utils/failure_message.dart';
import 'package:venuze_app/core/validators/validators.dart';
import 'package:venuze_app/core/widgets/app_button.dart';
import 'package:venuze_app/core/widgets/app_text_field.dart';
import 'package:venuze_app/core/widgets/sb.dart';
import '../controllers/login_controller.dart';
import '../widgets/captcha_box.dart';
import '../widgets/or_divider.dart';
import '../widgets/social_buttons.dart';
import '../widgets/text_with_action.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late final LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.find<LoginController>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    if (!_controller.isRobotChecked) {
      AppSnackBar.error(AppStrings.captchaRequired);
      return;
    }

    FocusScope.of(context).unfocus();

    final succeeded = await _controller.login(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (!mounted) return;

    if (succeeded) {
      Get.offAllNamed(AppRoutes.main);
      return;
    }

    final failure = _controller.failure;

    if (failure == null) return;

    AppSnackBar.error(FailureMessage.resolve(failure));
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
          child: Form(
            key: _formKey,
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
                  validator: Validators.email,
                ),
                SB.h(AppSizes.fieldGap.h),
                AppTextField.password(
                  controller: _passwordController,
                  hint: AppStrings.password,
                  validator: Validators.loginPassword,
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
                Obx(
                  () => CaptchaBox(
                    isChecked: _controller.isRobotChecked,
                    onChanged: _controller.setRobotChecked,
                  ),
                ),
                SB.h(AppSizes.gapCaptchaToButton.h),
                Obx(
                  () => AppButton(
                    label: AppStrings.login,
                    isLoading: _controller.isLoading,
                    onPressed: _onLogin,
                  ),
                ),
                SB.h(AppSizes.gapButtonToDivider.h),
                const OrDivider(),
                SB.h(AppSizes.gapButtonFromDivider.h),
                SocialButtons(
                  onFacebook: () {},
                  onGoogle: () {},
                  onApple: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
