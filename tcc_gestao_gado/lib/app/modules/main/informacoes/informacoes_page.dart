import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/presenter/informacoes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/view/informacoes_view_impl.dart';

class InformacoesPage extends StatefulWidget {
  static const routeName = '/informacoes';
  final InformacoesPresenter presenter;
  const InformacoesPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<InformacoesPage> createState() => _InformacoesPageState();
}

class _InformacoesPageState extends InformacoesViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBarWidget.appBar(context, title: '${widget.presenter.getName()}'),
      drawer: DrawerMenu(nameUser: '${widget.presenter.getName()}'),
      body: SafeArea(
        child: isActive
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: context.colors.background,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Column(
                        children: [
                          Image.network(listData[0]),
                          const SizedBox(height: 15),
                          Text(
                            listData[1],
                            overflow: TextOverflow.clip,
                            style: context.textStyles.textMedium.copyWith(
                              color: context.colors.primary,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Row(
                          //   children: [
                          //     Icon(Icons.circle, color: context.colors.primary),
                          //     const SizedBox(width: 5),
                          //     Expanded(
                          //       child: Text(
                          //         '{listInformation}',
                          //         style: context.textStyles.textMedium.copyWith(
                          //           color: context.colors.primary,
                          //           fontSize: 20,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 15),
                          // Row(
                          //   children: [
                          //     Icon(Icons.circle, color: context.colors.primary),
                          //     const SizedBox(width: 5),
                          //     Expanded(
                          //       child: Text(
                          //         'Para fazer 1 kg de queijo, uma vaca tem de comer 3 kg de comida.',
                          //         style: context.textStyles.textMedium.copyWith(
                          //           color: context.colors.primary,
                          //           fontSize: 20,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                color: context.colors.primary,
                child: const Center(child: CircularProgressIndicator()),
              ),
      ),
    );
  }
}
