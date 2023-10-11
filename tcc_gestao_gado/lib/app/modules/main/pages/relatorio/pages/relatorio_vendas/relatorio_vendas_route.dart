import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_vendas/presenter/relatorio_vendas_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_vendas/presenter/relatorio_vendas_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_vendas/relatorio_vendas_page.dart';

class RelatorioVendasRoute extends FlutterGetItPageRoute {
  const RelatorioVendasRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RelatorioVendasPresenter>(
            (i) => RelatorioVendasPresenterImpl(firebaseAuth: i(), mainRepository: i())),
      ];

  @override
  WidgetBuilder get page => (context) => RelatorioVendasPage(presenter: context.get());
}
