import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/presenter/relatorio_mortes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/view/relatorio_mortes_view_impl.dart';

class RelatorioMortesPage extends StatefulWidget {
  final RelatorioMortesPresenter presenter;
  static const routeName = '/relatorioMortes';
  const RelatorioMortesPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<RelatorioMortesPage> createState() => _RelatorioMortesPageState();
}

class _RelatorioMortesPageState extends RelatorioMortesViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
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
                            fontSize: 20,
                            color: context.colors.onPrimary,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Lista de animais mortos: :(',
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 22,
                      color: context.colors.onPrimary,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 15),
                  listDeath.isNotEmpty
                      ? ListView.builder(
                          itemCount: listDeath.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return active
                                ? Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: context.colors.onPrimary,
                                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                        height: 100,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            FittedBox(
                                              child: Text(
                                                'Nº do animal: ${listDeath[index].id!}',
                                                style: context.textStyles.textMedium.copyWith(
                                                  fontSize: 20,
                                                  color: context.colors.primary,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            FittedBox(
                                              child: Text(
                                                'Data da morte: ${listDeath[index].date!}',
                                                style: context.textStyles.textMedium.copyWith(
                                                  fontSize: 20,
                                                  color: context.colors.primary,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            listDeath[index].observations!.isNotEmpty
                                                ? FittedBox(
                                                    child: Text(
                                                      'obs: ${listDeath[index].observations!}',
                                                      style: context.textStyles.textMedium.copyWith(
                                                        fontSize: 20,
                                                        color: context.colors.primary,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15)
                                    ],
                                  )
                                : const CircularProgressIndicator.adaptive();
                          },
                        )
                      : FittedBox(
                          child: Text(
                            '\n\nOps... Lista vazia de mortes.',
                            style: context.textStyles.textMedium.copyWith(
                              fontSize: 20,
                              color: context.colors.onPrimary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
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
