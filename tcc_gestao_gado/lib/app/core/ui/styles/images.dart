import 'package:flutter/material.dart';

class Images {
  static Images? _instance;

  Images._();

  static Images get i {
    _instance ??= Images._();
    return _instance!;
  }

  String get splashImage => "assets/images/splash.jpg";
  String get introImage1 => "assets/images/intro_1.jpg";
  String get introImage2 => "assets/images/intro_2.jpg";
  String get introImage3 => "assets/images/intro_3.jpg";
  String get introImage4 => "assets/images/intro_4.jpg";
}

extension ImagesAppExtensions on BuildContext {
  Images get images => Images.i;
}
