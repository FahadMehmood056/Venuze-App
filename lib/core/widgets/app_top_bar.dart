import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venuze_app/core/constants/app_sizes.dart';
import 'package:venuze_app/core/constants/app_strings.dart';
import 'package:venuze_app/core/gen/assets.gen.dart';
import 'package:venuze_app/core/theme/app_colors.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    this.notificationCount = 0,
    this.onNotificationTap,
  }) : assert(notificationCount >= 0);

  final int notificationCount;
  final VoidCallback? onNotificationTap;

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.bookingsHeaderHeight.h);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.bookingsHeaderShadow,
            offset: Offset(0, AppSizes.bookingsHeaderShadowOffsetY),
            blurRadius: AppSizes.bookingsHeaderShadowBlur,
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: preferredSize.height,
          child: Padding(
            padding: EdgeInsets.only(
              left: AppSizes.bookingsHeaderPaddingLeft.w,
              right: AppSizes.bookingsHeaderPaddingRight.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.images.logo.image(
                  width: AppSizes.bookingsHeaderLogoWidth.w,
                  height: AppSizes.bookingsHeaderLogoHeight.h,
                  fit: BoxFit.contain,
                ),
                _NotificationButton(
                  count: notificationCount,
                  onTap: onNotificationTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton({required this.count, required this.onTap});

  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final badgeSize = AppSizes.notificationBadgeSize.w;
    final borderWidth = AppSizes.notificationBadgeBorderWidth.w;
    final outerBadgeSize = badgeSize + borderWidth * 2;
    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      label: AppStrings.notifications,
      value: count > 0
          ? AppStrings.unreadNotifications(count)
          : AppStrings.noUnreadNotifications,
      button: true,
      enabled: onTap != null,
      onTap: onTap,
      excludeSemantics: true,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox.square(
            dimension: AppSizes.notificationButtonSize.w,
            child: Material(
              color: colors.primary,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onTap,
                customBorder: const CircleBorder(),
                child: Center(
                  child: Assets.icons.bell.svg(
                    width: AppSizes.notificationIconWidth.w,
                    height: AppSizes.notificationIconHeight.h,
                    colorFilter: ColorFilter.mode(
                      colors.surface,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (count > 0)
            Positioned(
              top: -borderWidth,
              right: -AppSizes.notificationBadgeOverhang.w - borderWidth,
              child: IgnorePointer(
                child: Container(
                  width: outerBadgeSize,
                  height: outerBadgeSize,
                  padding: EdgeInsets.all(borderWidth),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    shape: BoxShape.circle,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: colors.onSurface,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.notificationBadgeLabel(count),
                        style: text.labelSmall?.copyWith(color: colors.surface),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
