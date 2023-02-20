import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      this.backgroundColor,
      this.foregroundColor,
      this.icon,
      this.padding,
      this.onPressed});

  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Icon? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: FloatingActionButton(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
