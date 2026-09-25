import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venuze_app/core/constants/app_sizes.dart';
import 'package:venuze_app/core/constants/app_strings.dart';
import 'package:venuze_app/core/routes/app_pages.dart';
import 'package:venuze_app/core/theme/app_theme.dart';

class VenuzeApp extends StatelessWidget {
  const VenuzeApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(AppSizes.designWidth, AppSizes.designHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: initialRoute,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
