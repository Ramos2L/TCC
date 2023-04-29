import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_principal.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/presenter/consulta_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/view/consulta_view_impl.dart';

class ConsultaPage extends StatefulWidget {
  static const routeName = '/consulta';
  final ConsultaPresenter presenter;
  const ConsultaPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<ConsultaPage> createState() => _ConsultaPageState();
}

class _ConsultaPageState extends ConsultaViewImpl {
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
                  'Consutar animais',
                  style: context.textStyles.textMedium.copyWith(
                    color: context.colors.onPrimary,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'Para consultar apenas digite o código do animal para ser buscado todas informações.',
                  style: context.textStyles.textMedium.copyWith(
                    color: context.colors.onPrimary,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  //controller: ,
                  hintText: 'Código do animal',
                  labelStyle: TextStyle(color: context.colors.background),
                  inputDecoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 14,
                      color: context.colors.error,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  suffixIcon: const Icon(Icons.search),
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(phoneNode);
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
