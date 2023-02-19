import 'package:flutter/material.dart';

class Images {
  static Images? _instance;

  Images._();

  static Images get i {
    _instance ??= Images._();
    return _instance!;
  }

  String get splashImage => "assets/images/splash.jpg";
}

extension ImagesAppExtensions on BuildContext {
  Images get images => Images.i;
}
