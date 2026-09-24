import 'package:flutter/material.dart';
import 'package:venuze_app/core/constants/app_sizes.dart';

enum _LoaderVariant { standalone, onButton }

class AppLoader extends StatelessWidget {
  const AppLoader({super.key})
    : size = AppSizes.loaderLarge,
      _variant = _LoaderVariant.standalone;

  const AppLoader.button({super.key})
    : size = AppSizes.loaderSmall,
      _variant = _LoaderVariant.onButton;

  final double size;
  final _LoaderVariant _variant;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        strokeWidth: 4,
        color: switch (_variant) {
          _LoaderVariant.standalone => colors.primary,
          _LoaderVariant.onButton => colors.onPrimary,
        },
      ),
    );
  }
}
