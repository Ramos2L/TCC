import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_principal.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/pasto/presenter/pasto_presenter.dart';

class PastoPage extends StatefulWidget {
  static const routeName = '/pasto';
  final PastoPresenter presenter;
  const PastoPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<PastoPage> createState() => _PastoPageState();
}

class _PastoPageState extends State<PastoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBarWidget.appBar(context, title: '${widget.presenter.getName()}'),
      drawer: DrawerMenu(nameUser: '${widget.presenter.getName()}'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              children: [
                const ContainerPrincipal(),
                const SizedBox(height: 25),
                Text(
                  'Pasto',
                  style: context.textStyles.textMedium.copyWith(
                    fontSize: 20,
                    color: context.colors.onPrimary,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Número de Piquetes',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 20,
                      color: context.colors.primary,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/n_piquetes'),
                ),
                // const SizedBox(height: 15),
                // GestureDetector(
                //   child: ContainerWidget(
                //     title: 'Divisão da Área',
                //     height: 75,
                //     width: MediaQuery.of(context).size.width,
                //     style: context.textStyles.textMedium.copyWith(
                //       color: context.colors.primary,
                //       fontSize: 20,
                //       overflow: TextOverflow.ellipsis,
                //     ),
                //   ),
                //   onTap: () {},
                // ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Calagem',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 20,
                      color: context.colors.primary,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/calagem'),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Adubação',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 20,
                      color: context.colors.primary,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/adubacao'),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
