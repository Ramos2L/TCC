import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_principal.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/preco_arroba/presenter/preco_arroba_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/preco_arroba/view/preco_arroba_view_impl.dart';

class PrecoArrobaPage extends StatefulWidget {
  static const routeName = '/preco_arroba';
  final PrecoArrobaPresenter presenter;
  const PrecoArrobaPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<PrecoArrobaPage> createState() => _PrecoArrobaPageState();
}

class _PrecoArrobaPageState extends PrecoArrobaViewImpl {
  String? gender;
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
                      'Preço da Arroba',
                      style: context.textStyles.textMedium.copyWith(
                        fontSize: 20,
                        color: context.colors.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      '...',
                      style: context.textStyles.textMedium.copyWith(
                        fontSize: 20,
                        color: context.colors.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Atualizações Futuras',
                      style: context.textStyles.textMedium.copyWith(
                        fontSize: 20,
                        color: context.colors.onPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
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
