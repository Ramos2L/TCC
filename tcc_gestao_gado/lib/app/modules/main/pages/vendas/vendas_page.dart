import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_principal.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/vendas/presenter/vendas_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/vendas/view/vendas_view_impl.dart';

class Arguments {
  final String animal;

  Arguments(this.animal);
}

class VendasPage extends StatefulWidget {
  static const routeName = '/vendas';
  final VendasPresenter presenter;
  const VendasPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<VendasPage> createState() => _VendasPageState();
}

class _VendasPageState extends VendasViewImpl {
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
                  'Vendas',
                  style: context.textStyles.textMedium.copyWith(
                    color: context.colors.onPrimary,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Vaca',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/venda_animal',
                      arguments: Arguments('Vaca'),
                    );
                  },
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Touro',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/venda_animal',
                      arguments: Arguments('Touro'),
                    );
                  },
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Boi',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/venda_animal',
                      arguments: Arguments('Boi'),
                    );
                  },
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Bezerro',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/venda_animal',
                      arguments: Arguments('Bezerro'),
                    );
                  },
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Novilha',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/venda_animal',
                      arguments: Arguments('Novilha'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
