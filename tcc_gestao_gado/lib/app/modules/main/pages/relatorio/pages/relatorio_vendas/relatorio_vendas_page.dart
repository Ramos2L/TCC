import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_vendas/presenter/relatorio_vendas_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_vendas/view/relatorio_vendas_view_impl.dart';

class RelatorioVendasPage extends StatefulWidget {
  final RelatorioVendasPresenter presenter;
  static const routeName = '/relatorio_vendas';
  const RelatorioVendasPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<RelatorioVendasPage> createState() => _RelatorioVendasPageState();
}

class _RelatorioVendasPageState extends RelatorioVendasViewImpl {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      IconButton(
                        icon: Icon(Icons.print, color: context.colors.onPrimary),
                        onPressed: () async {
                          String path = await pdf();
                          toScreenPDF(path: path);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Lista de animais vendidos: :)',
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 22,
                      color: context.colors.onPrimary,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 15),
                  listSales.isNotEmpty
                      ? ListView.builder(
                          itemCount: listSales.length,
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
                                                'Nº do animal: ${listSales[index].id!}',
                                                textAlign: TextAlign.justify,
                                                style: context.textStyles.textMedium.copyWith(
                                                  fontSize: 20,
                                                  color: context.colors.primary,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            FittedBox(
                                              child: Text(
                                                'Data da morte: ${listSales[index].date!}',
                                                style: context.textStyles.textMedium.copyWith(
                                                  fontSize: 20,
                                                  color: context.colors.primary,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            listSales[index].price!.isNotEmpty
                                                ? FittedBox(
                                                    child: Text(
                                                      'preço: ${listSales[index].price!}',
                                                      style: context.textStyles.textMedium.copyWith(
                                                        fontSize: 20,
                                                        color: context.colors.primary,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                            listSales[index].weightCattle!.isNotEmpty
                                                ? FittedBox(
                                                    child: Text(
                                                      'peso: ${listSales[index].weightCattle!}',
                                                      style: context.textStyles.textMedium.copyWith(
                                                        fontSize: 20,
                                                        color: context.colors.primary,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                            listSales[index].observations!.isNotEmpty
                                                ? FittedBox(
                                                    child: Text(
                                                      'obs: ${listSales[index].observations!}',
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
                            '\n\nOps... Lista vazia de vendas de animais.',
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

  Future<String> pdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (context) {
          return [
            pw.ListView.builder(
              itemBuilder: (pw.Context context, int index) {
                return pw.Column(
                  children: [
                    pw.Column(
                      children: [
                        pw.Text(
                          'Nº do animal: ${listSales[index].id!}',
                          style: const pw.TextStyle(fontSize: 40),
                        ),
                        pw.Text(
                          'peso: ${listSales[index].weightCattle!}',
                          style: const pw.TextStyle(fontSize: 40),
                        ),
                        pw.Text(
                          'Preço: ${listSales[index].price!}',
                          style: const pw.TextStyle(fontSize: 40),
                        ),
                        pw.Text(
                          'obs: ${listSales[index].observations!}',
                          style: const pw.TextStyle(fontSize: 40),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Divider(height: 2),
                        pw.SizedBox(height: 10),
                      ],
                    ),
                  ],
                );
              },
              itemCount: listSales.length,
            ),
          ];
        },
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;

    final String path = '$dir/pdfVendas.pdf';

    final File file = File(path);

    await file.writeAsBytes(await pdf.save());

    return path;
  }
}
