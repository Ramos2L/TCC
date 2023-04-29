import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/conta/presenter/conta_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/conta/view/conta_view_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/conta/widgets/list_tile_widget.dart';

class ContaPage extends StatefulWidget {
  static const routeName = '/conta';
  final ContaPresenter presenter;
  const ContaPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<ContaPage> createState() => _ContaPageState();
}

class _ContaPageState extends ContaViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        Icon(
                          color: context.colors.onPrimary,
                          Icons.arrow_back_rounded,
                          size: 35,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'Voltar',
                          style: context.textStyles.textMedium.copyWith(
                            color: context.colors.onPrimary,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
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
                  ListTileWidget(
                    title: 'NOME',
                    subtitle: '${widget.presenter.getName()}',
                  ),
                  ListTileWidget(
                    title: 'NOME DA PROPRIEDADE',
                    subtitle: '${widget.presenter.getFarm()}',
                  ),
                  ListTileWidget(
                    title: 'E-MAIL',
                    subtitle: '${widget.presenter.getEmail()}',
                  ),
                  ListTileWidget(
                    title: 'TELEFONE',
                    subtitle: '${widget.presenter.getPhone()}',
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
