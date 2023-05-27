import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_principal.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/presenter/relatorio_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/view/relatorio_view_impl.dart';

class RelatorioPage extends StatefulWidget {
  static const routeName = '/relatorio';
  final RelatorioPresenter presenter;
  const RelatorioPage({super.key, required this.presenter});

  @override
  State<RelatorioPage> createState() => _RelatorioPageState();
}

class _RelatorioPageState extends RelatorioViewImpl {
  bool refresh = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBarWidget.appBar(context, title: '${widget.presenter.getName()}'),
      drawer: DrawerMenu(nameUser: '${widget.presenter.getName()}'),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  children: [
                    ContainerPrincipal(refresh: refresh),
                    const SizedBox(height: 25),
                    Text(
                      'Relatório Geral',
                      style: context.textStyles.textMedium.copyWith(
                        fontSize: 20,
                        color: context.colors.onPrimary,
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
                          fontSize: 20,
                          color: context.colors.primary,
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
                          fontSize: 20,
                          color: context.colors.primary,
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
                          fontSize: 20,
                          color: context.colors.primary,
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
                          fontSize: 20,
                          color: context.colors.primary,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      child: ContainerWidget(
                        title: 'Mortes',
                        height: 75,
                        width: MediaQuery.of(context).size.width,
                        style: context.textStyles.textMedium.copyWith(
                          fontSize: 20,
                          color: context.colors.primary,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      onTap: () => Navigator.pushNamed(context, '/relatorioMortes'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    setState(() => refresh = !refresh);
    return Future.delayed(const Duration(seconds: 1));
  }
}
