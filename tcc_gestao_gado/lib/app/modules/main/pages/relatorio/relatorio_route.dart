import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/presenter/relatorio_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/presenter/relatorio_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/relatorio_page.dart';

class RelatorioRoute extends FlutterGetItPageRoute {
  const RelatorioRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RelatorioPresenter>(
            (i) => RelatorioPresenterImpl(userStore: i(), mainRepository: i())),
      ];

  @override
  WidgetBuilder get page => (context) => RelatorioPage(presenter: context.get());
}
