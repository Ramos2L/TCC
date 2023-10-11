import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_animals/presenter/relatorio_animals_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_animals/presenter/relatorio_animals_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_animals/relatorio_animals_page.dart';

class RelatorioAnimalsRoute extends FlutterGetItPageRoute {
  const RelatorioAnimalsRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RelatorioAnimalsPresenter>(
            (i) => RelatorioAnimalsPresenterImpl(firebaseAuth: i(), mainRepository: i())),
      ];

  @override
  WidgetBuilder get page => (context) => RelatorioAnimalsPage(presenter: context.get());
}
