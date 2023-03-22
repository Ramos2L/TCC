import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colors.background,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.colors.background,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatarWidget(
                  width: 100,
                  height: 100,
                  image: context.images.introImage1,
                ),
                Text(
                  'Lucas Ramos',
                  style: context.textStyles.textLight.copyWith(
                    color: context.colors.secondary,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1.5, color: context.colors.primary),
          const SizedBox(height: 10),
          ListTile(
            title: Text(
              'Manejo',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/manejo');
            },
          ),
          ListTile(
            title: Text(
              'Cadastro de animais',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/consulta');
            },
          ),
          ListTile(
            title: Text(
              'Consultar animais',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/consultar');
            },
          ),
          ListTile(
            title: Text(
              'Relatório',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/relatorio');
            },
          ),
          ListTile(
            title: Text(
              'Vendas',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/vendas');
            },
          ),
          ListTile(
            title: Text(
              'Pasto',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/pasto');
            },
          ),
          ListTile(
            title: Text(
              'Conta',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Sobre',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Sair',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.secondary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
