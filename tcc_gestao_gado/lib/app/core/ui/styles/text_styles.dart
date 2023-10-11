import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  TextStyle get textExtraLight =>
      TextStyle(color: AppColors.i.primary, fontWeight: FontWeight.w200, fontFamily: "poppins");

  TextStyle get textLight =>
      TextStyle(color: AppColors.i.primary, fontWeight: FontWeight.w300, fontFamily: "poppins");

  TextStyle get textRegular =>
      TextStyle(color: AppColors.i.primary, fontWeight: FontWeight.normal, fontFamily: "poppins");

  TextStyle get textMedium =>
      TextStyle(color: AppColors.i.primary, fontWeight: FontWeight.w500, fontFamily: "poppins");

  TextStyle get textBold =>
      TextStyle(color: AppColors.i.primary, fontWeight: FontWeight.bold, fontFamily: "poppins");

  TextStyle get textExtraBold =>
      TextStyle(color: AppColors.i.primary, fontWeight: FontWeight.w800, fontFamily: "poppins");
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
