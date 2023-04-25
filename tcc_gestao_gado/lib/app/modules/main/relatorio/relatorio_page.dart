import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/relatorio/presenter/relatorio_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/relatorio/view/relatorio_view_impl.dart';

import '../../../core/ui/widgets/container_principal.dart';

class RelatorioPage extends StatefulWidget {
  static const routeName = '/relatorio';
  final RelatorioPresenter presenter;
  const RelatorioPage({super.key, required this.presenter});

  @override
  State<RelatorioPage> createState() => _RelatorioPageState();
}

class _RelatorioPageState extends RelatorioViewImpl {
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
                  'Relatório Geral',
                  style: context.textStyles.textMedium.copyWith(
                    color: context.colors.onPrimary,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Pesagens',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Manejo',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Animais',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Compras',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Vendas',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
