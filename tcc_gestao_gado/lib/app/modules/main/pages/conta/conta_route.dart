import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/conta/conta_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/conta/presenter/conta_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/conta/presenter/conta_presenter_impl.dart';

class ContaRoute extends FlutterGetItPageRoute {
  const ContaRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<ContaPresenter>((i) => ContaPresenterImpl(userStore: i())),
      ];

  @override
  WidgetBuilder get page => (context) => ContaPage(presenter: context.get());
}
