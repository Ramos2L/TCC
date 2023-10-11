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
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        title!,
        style: context.textStyles.textMedium.copyWith(
          fontSize: 18,
          overflow: TextOverflow.ellipsis,
          color: context.colors.outlineVariant,
        ),
      ),
      subtitle: Text(
        subtitle!,
        style: context.textStyles.textLight.copyWith(
          fontSize: 22,
          color: context.colors.onPrimary,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
