import 'package:flutter/material.dart';

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
      child: CircleAvatar(backgroundImage: AssetImage(image!)),
    );
  }
}
