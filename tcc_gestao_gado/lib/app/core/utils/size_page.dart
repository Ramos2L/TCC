import 'package:flutter/material.dart';

class SizePage {
  static bool isSmallScreenWidth(BuildContext context) => MediaQuery.of(context).size.width < 340;
  static bool isSmallScreenHeight(BuildContext context) => MediaQuery.of(context).size.width < 660;
}
