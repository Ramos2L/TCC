import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._();

  static ButtonStyles get i {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: AppColors.i.secondary,
        foregroundColor: AppColors.i.primary,
        minimumSize: const Size.fromHeight(60),
        shape: const ContinuousRectangleBorder(),
      );

  ButtonStyle get secondaryButton => ElevatedButton.styleFrom(
        backgroundColor: AppColors.i.primary,
        foregroundColor: AppColors.i.secondary,
        minimumSize: const Size.fromHeight(60),
        shape: const ContinuousRectangleBorder(),
      );
}

extension ButtonStylesExtensions on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.i;
}
