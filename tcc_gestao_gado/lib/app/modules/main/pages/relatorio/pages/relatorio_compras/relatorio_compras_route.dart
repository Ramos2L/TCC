import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_compras/presenter/relatorio_compras_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_compras/presenter/relatorio_compras_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_compras/relatorio_compras_page.dart';

class RelatorioComprasRoute extends FlutterGetItPageRoute {
  const RelatorioComprasRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RelatorioComprasPresenter>(
            (i) => RelatorioComprasPresenterImpl(firebaseAuth: i(), mainRepository: i())),
      ];

  @override
  WidgetBuilder get page => (context) => RelatorioComprasPage(presenter: context.get());
}
