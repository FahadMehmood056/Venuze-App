import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/models/nav_item.dart';
import '../../../../core/widgets/app_bottom_nav.dart';
import '../../../bookings/presentation/pages/bookings_page.dart';
import '../controllers/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  static final List<NavItem> _navItems = [
    NavItem(iconPath: Assets.icons.home.path, label: AppStrings.home),
    NavItem(iconPath: Assets.icons.explore.path, label: AppStrings.explore),
    NavItem(iconPath: Assets.icons.bookings.path, label: AppStrings.bookings),
    NavItem(iconPath: Assets.icons.profile.path, label: AppStrings.profile),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            SizedBox.shrink(),
            SizedBox.shrink(),
            BookingsPage(),
            SizedBox.shrink(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => AppBottomNav(
          items: _navItems,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
        ),
      ),
    );
  }
}
