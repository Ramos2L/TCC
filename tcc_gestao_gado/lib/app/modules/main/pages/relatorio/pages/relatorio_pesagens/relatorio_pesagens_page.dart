import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_pesagens/presenter/relatorio_pesagens_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_pesagens/view/relatorio_pesagens_view_impl.dart';

class RelatorioPesagensPage extends StatefulWidget {
  final RelatorioPesagensPresenter presenter;
  static const routeName = '/relatorio_pesagens';
  const RelatorioPesagensPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<RelatorioPesagensPage> createState() => _RelatorioPesagensPageState();
}

class _RelatorioPesagensPageState extends RelatorioPesagensViewImpl {
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
                    'Lista de peso de animais: :)',
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 22,
                      color: context.colors.onPrimary,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 15),
                  listWeighings.isNotEmpty
                      ? ListView.builder(
                          itemCount: listWeighings.length,
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
                                        height: MediaQuery.of(context).size.height * 0.175,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            FittedBox(
                                              child: Text(
                                                'Nº do animal: ${listWeighings[index].id!}',
                                                textAlign: TextAlign.justify,
                                                style: context.textStyles.textMedium.copyWith(
                                                  fontSize: 20,
                                                  color: context.colors.primary,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            // FittedBox(
                                            //   child: Text(
                                            //     'Data da ultima pesagem: ${listWeighings[index].date!}',
                                            //     style: context.textStyles.textMedium.copyWith(
                                            //       fontSize: 20,
                                            //       color: context.colors.primary,
                                            //       overflow: TextOverflow.ellipsis,
                                            //     ),
                                            //   ),
                                            // ),
                                            listWeighings[index].race!.isNotEmpty
                                                ? FittedBox(
                                                    child: Text(
                                                      'Raça: ${listWeighings[index].race!}',
                                                      style: context.textStyles.textMedium.copyWith(
                                                        fontSize: 20,
                                                        color: context.colors.primary,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                            listWeighings[index].weightCattle!.isNotEmpty
                                                ? FittedBox(
                                                    child: Text(
                                                      'peso: ${listWeighings[index].weightCattle!}',
                                                      style: context.textStyles.textMedium.copyWith(
                                                        fontSize: 20,
                                                        color: context.colors.primary,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                            listWeighings[index].observations!.isNotEmpty
                                                ? FittedBox(
                                                    child: Text(
                                                      'obs: ${listWeighings[index].observations!}',
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
                            '\n\nOps... Lista vazia de peso de animais',
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
