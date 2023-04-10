import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, this.title, this.subtitle});

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
      title: Text(
        title!,
        style: context.textStyles.textMedium.copyWith(
          color: context.colors.outlineVariant,
          fontSize: 18,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Text(
        subtitle!,
        style: context.textStyles.textLight.copyWith(
          color: context.colors.onPrimary,
          fontSize: 22,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
