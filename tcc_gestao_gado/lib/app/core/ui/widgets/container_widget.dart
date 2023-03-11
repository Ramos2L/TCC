import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget(
      {super.key, this.style, required this.title, required this.height, required this.width});

  final TextStyle? style;
  final String title;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: style,
          ),
        ),
      ),
    );
  }
}
