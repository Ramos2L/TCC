import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';

class AppTheme {
  AppTheme._();

  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide.none,
  );

  static final ThemeData theme = ThemeData(
    primaryColor: AppColors.i.primary,
    primarySwatch: Colors.brown, //Color(0xFF506353),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(AppColors.i.tertiaryContainer),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.i.onInverseSurface,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
    ),
  );
}
