import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_sizes.dart';
import '../models/nav_item.dart';
import '../theme/app_colors.dart';
import 'sb.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<NavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Container(
      height: AppSizes.bottomNavHeight.h + MediaQuery.paddingOf(context).bottom,
      padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.navShadow,
            blurRadius: AppSizes.navShadowBlur,
            offset: const Offset(0, AppSizes.navShadowOffsetY),
          ),
        ],
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isActive = currentIndex == index;
          final color = isActive ? colors.primary : AppColors.textInactive;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    item.iconPath,
                    width: AppSizes.navIconSize.w,
                    height: AppSizes.navIconSize.w,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
                  SB.h(AppSizes.paddingSmall.h),
                  Text(
                    item.label,
                    style: text.labelSmall?.copyWith(color: color),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
