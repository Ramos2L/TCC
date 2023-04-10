import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';

class AppBarWidget {
  static AppBar appBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: context.colors.onPrimary, size: 50),
      title: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            'Olá, Lucas',
            style: context.textStyles.textMedium.copyWith(
              color: context.colors.onPrimary,
              fontSize: 20,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CircleAvatarWidget(width: 50, height: 50, image: context.images.introImage1),
        ),
      ],
    );
  }
}
