import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({super.key, this.width, this.height, this.image});

  final double? width;
  final double? height;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircleAvatar(
        backgroundImage: AssetImage(image!),
        backgroundColor: context.colors.primary,
      ),
    );
  }
}
