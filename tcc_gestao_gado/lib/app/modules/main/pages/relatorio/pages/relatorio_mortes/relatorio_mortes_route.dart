import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/presenter/relatorio_mortes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/presenter/relatorio_mortes_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/relatorio_mortes_page.dart';

class RelatorioMortesRoute extends FlutterGetItPageRoute {
  const RelatorioMortesRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RelatorioMortesPresenter>(
            (i) => RelatorioMortesPresenterImpl(firebaseAuth: i(), mainRepository: i())),
      ];

  @override
  WidgetBuilder get page => (context) => RelatorioMortesPage(presenter: context.get());
}
