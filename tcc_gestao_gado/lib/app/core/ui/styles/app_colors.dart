import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => const Color(0xFF006D38);
  Color get onPrimary => const Color(0xFFFFFFFF);
  Color get primaryContainer => const Color(0xFF9BF6B3);
  Color get onPrimaryContainer => const Color(0xFF00210D);
  Color get secondary => const Color(0xFF506353);
  Color get onSecondary => const Color(0xFFFFFFFF);
  Color get secondaryContainer => const Color(0xFFD2E8D3);
  Color get onSecondaryContainer => const Color(0xFF0D1F12);
  Color get tertiary => const Color(0xFF3A656F);
  Color get onTertiary => const Color(0xFFFFFFFF);
  Color get tertiaryContainer => const Color(0xFFBEEAF6);
  Color get onTertiaryContainer => const Color(0xFF001F25);
  Color get error => const Color(0xFFBA1A1A);
  Color get errorContainer => const Color(0xFFFFDAD6);
  Color get onError => const Color(0xFFFFFFFF);
  Color get onErrorContainer => const Color(0xFF410002);
  Color get background => const Color(0xFFFBFDF7);
  Color get onBackground => const Color(0xFF191C19);
  Color get surface => const Color(0xFFFBFDF7);
  Color get onSurface => const Color(0xFF191C19);
  Color get surfaceVariant => const Color(0xFFDDE5DA);
  Color get onSurfaceVariant => const Color(0xFF414941);
  Color get outline => const Color(0xFF717971);
  Color get onInverseSurface => const Color(0xFFF0F1EC);
  Color get inverseSurface => const Color(0xFF2E312E);
  Color get inversePrimary => const Color(0xFF7FD998);
  Color get shadow => const Color(0xFF000000);
  Color get surfaceTint => const Color(0xFF006D38);
  Color get outlineVariant => const Color(0xFFC1C9BF);
  Color get scrim => const Color(0xFF000000);
}

extension ColorsAppExtensions on BuildContext {
  AppColors get colors => AppColors.i;
}
