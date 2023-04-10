import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/conta/widgets/list_tile_widget.dart';

class ContaPage extends StatelessWidget {
  static const routeName = '/conta';
  const ContaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBarWidget.appBar(context),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(
                children: [
                  CircleAvatarWidget(
                    width: 125,
                    height: 125,
                    image: context.images.introImage1,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Informações da Conta',
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.onPrimary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const ListTileWidget(
                    title: 'NOME',
                    subtitle: 'Lucas Ramos',
                  ),
                  const ListTileWidget(
                    title: 'E-MAIL',
                    subtitle: 'lucasramosleite0@gmail.com',
                  ),
                  const ListTileWidget(
                    title: 'TELEFONE',
                    subtitle: '(66) 992029888',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
