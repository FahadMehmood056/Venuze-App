import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venuze_app/core/constants/app_sizes.dart';
import 'package:venuze_app/core/constants/app_strings.dart';
import 'package:venuze_app/core/gen/assets.gen.dart';
import 'package:venuze_app/core/theme/app_colors.dart';
import 'package:venuze_app/core/widgets/app_button.dart';
import 'package:venuze_app/core/widgets/sb.dart';

class BookingsEmptyState extends StatelessWidget {
  const BookingsEmptyState({super.key, required this.onSignIn});

  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.horizontalPadding.w,
                vertical: AppSizes.paddingLarge.h,
              ),
              child: Center(
                child: SizedBox(
                  width: AppSizes.bookingsEmptyContentWidth.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _BookingsIllustration(),
                      SB.h(AppSizes.bookingsIllustrationToTitle.h),
                      Text(
                        AppStrings.noBookingsFound,
                        textAlign: TextAlign.center,
                        style: text.titleLarge,
                      ),
                      SB.h(AppSizes.bookingsTitleToSubtitle.h),
                      Text(
                        AppStrings.bookingsSubtitle,
                        textAlign: TextAlign.center,
                        style: text.bodyMedium?.copyWith(fontSize: 12.w),
                      ),
                      SB.h(AppSizes.bookingsSubtitleToButton.h),
                      AppButton.compact(
                        label: AppStrings.signIn,
                        onPressed: onSignIn,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BookingsIllustration extends StatelessWidget {
  const _BookingsIllustration();

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: SizedBox(
        width: AppSizes.bookingsIllustrationWidth.w,
        height: AppSizes.bookingsIllustrationHeight.w,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Assets.images.calendar.svg(
                width: AppSizes.bookingsCalendarSize.w,
                height: AppSizes.bookingsCalendarSize.w,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: AppSizes.bookingsStatusCircleLeft.w,
              top: AppSizes.bookingsStatusCircleTop.w,
              child: Container(
                width: AppSizes.bookingsStatusCircleSize.w,
                height: AppSizes.bookingsStatusCircleSize.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.bookingsIllustrationShadow,
                      offset: Offset(
                        0,
                        AppSizes.bookingsIllustrationShadowOffsetY.w,
                      ),
                      blurRadius: AppSizes.bookingsIllustrationShadowBlur.w,
                    ),
                  ],
                ),
                child: Center(
                  child: Assets.icons.prohibition.svg(
                    width: AppSizes.bookingsStatusIconSize.w,
                    height: AppSizes.bookingsStatusIconSize.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
