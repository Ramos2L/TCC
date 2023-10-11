import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button_home.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/home/presenter/home_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/home/view/home_view_impl.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  final HomePresenter presenter;
  const HomePage({super.key, required this.presenter});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewImpl {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (canPop) {
          return true;
        } else {
          widget.presenter.dialogFluxo();
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBarWidget.appBar(context, title: '${widget.presenter.getName()}'),
        drawer: DrawerMenu(nameUser: '${widget.presenter.getName()}'),
        backgroundColor: context.colors.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonHome(
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
                      ),
                      image: context.images.manejo,
                      label: 'manejo',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        fontSize: 20,
                        color: context.colors.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/manejo'),
                    ),
                    const SizedBox(width: 15),
                    ButtonHome(
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
                      ),
                      image: context.images.add,
                      label: 'cadastro',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        fontSize: 20,
                        color: context.colors.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/cadastro'),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonHome(
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
                      ),
                      image: context.images.buscar,
                      label: 'consultar animal',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        fontSize: 20,
                        color: context.colors.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/consulta'),
                    ),
                    const SizedBox(width: 15),
                    ButtonHome(
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
                      ),
                      image: context.images.relatorio,
                      label: 'relatório',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        fontSize: 20,
                        color: context.colors.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/relatorio'),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonHome(
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
                      ),
                      image: context.images.vendas,
                      label: 'vendas',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        fontSize: 20,
                        color: context.colors.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/vendas'),
                    ),
                    const SizedBox(width: 15),
                    ButtonHome(
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
                      ),
                      image: context.images.pasto,
                      label: 'pasto',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        fontSize: 20,
                        color: context.colors.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/pasto'),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonHome(
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
                      ),
                      image: context.images.informacao,
                      label: 'informações',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        fontSize: 20,
                        color: context.colors.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/informacoes'),
                    ),
                    const SizedBox(width: 15),
                    ButtonHome(
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
                      ),
                      image: context.images.perfil,
                      label: 'perfil',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        fontSize: 20,
                        color: context.colors.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/conta'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
