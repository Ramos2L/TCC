import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';

class CountWidget extends StatelessWidget {
  const CountWidget({super.key, required this.index, this.padding});
  final int index;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Tabs(isAtive: index == 1),
          const SizedBox(width: 20),
          Tabs(isAtive: index == 2),
          const SizedBox(width: 20),
          Tabs(isAtive: index == 3),
          const SizedBox(width: 20),
          Tabs(isAtive: index == 4),
        ],
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  const Tabs({super.key, required this.isAtive});

  final bool isAtive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 15,
        height: 7,
        color: isAtive ? context.colors.onPrimary : context.colors.secondary,
      ),
    );
  }
}
