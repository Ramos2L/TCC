import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/pasto/pasto_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/pasto/presenter/pasto_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/pasto/presenter/pasto_presenter_impl.dart';

class PastoRoute extends FlutterGetItPageRoute {
  const PastoRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<PastoPresenter>((i) => PastoPresenterImpl(userStore: i())),
      ];

  @override
  WidgetBuilder get page => (context) => PastoPage(presenter: context.get());
}
