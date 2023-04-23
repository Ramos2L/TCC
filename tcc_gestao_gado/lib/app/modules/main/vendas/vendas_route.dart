import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/vendas/presenter/vendas_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/vendas/presenter/vendas_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/vendas/vendas_page.dart';

class VendasRoute extends FlutterGetItPageRoute {
  const VendasRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<VendasPresenter>((i) => VendasPresenterImpl(userStore: i())),
      ];

  @override
  WidgetBuilder get page => (context) => VendasPage(presenter: context.get());
}
