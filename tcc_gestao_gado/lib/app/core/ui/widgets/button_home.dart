import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({
    super.key,
    this.buttonStyle,
    this.width,
    this.height,
    this.image,
    required this.label,
    this.styleLabel,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final ButtonStyle? buttonStyle;
  final double? width;
  final double? height;
  final String? image;
  final String label;
  final TextStyle? styleLabel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatarWidget(image: image, width: 100, height: 100),
            FittedBox(child: Text(label, style: styleLabel)),
          ],
        ),
      ),
    );
  }
}
