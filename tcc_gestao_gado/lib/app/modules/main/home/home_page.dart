import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button_home.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/home/presenter/home_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/home/view/home_view_impl.dart';

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
                      label: 'MANEJO',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        color: context.colors.onPrimary,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/manejo');
                      },
                    ),
                    const SizedBox(width: 15),
                    ButtonHome(
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
                      ),
                      image: context.images.add,
                      label: 'CADASTRO',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        color: context.colors.onPrimary,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastro');
                      },
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
                      label: 'CONSULTAR ANIMAL',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        color: context.colors.onPrimary,
                        fontSize: 20,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/consulta');
                      },
                    ),
                    const SizedBox(width: 15),
                    ButtonHome(
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
                      ),
                      image: context.images.relatorio,
                      label: 'RELATÓRIO',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        color: context.colors.onPrimary,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/relatorio');
                      },
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
                      image: context.images.nascimento,
                      label: 'NASCIMENTO',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        color: context.colors.onPrimary,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/nascimento');
                      },
                    ),
                    const SizedBox(width: 15),
                    ButtonHome(
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
                      ),
                      image: context.images.vendas,
                      label: 'VENDAS',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        color: context.colors.onPrimary,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/vendas');
                      },
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
                      image: context.images.pasto,
                      label: 'PASTO',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        color: context.colors.onPrimary,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/pasto');
                      },
                    ),
                    const SizedBox(width: 15),
                    ButtonHome(
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
                      ),
                      image: context.images.informacao,
                      label: 'INFORMAÇÕES',
                      styleLabel: context.textStyles.textMedium.copyWith(
                        color: context.colors.onPrimary,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/informacoes');
                      },
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
