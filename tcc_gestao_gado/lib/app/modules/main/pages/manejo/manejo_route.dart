import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/manejo_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/presenter/manejo_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/presenter/manejo_presenter_impl.dart';

class ManejoRoute extends FlutterGetItPageRoute {
  const ManejoRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<ManejoPresenter>((i) => ManejoPresenterImpl(userStore: i())),
      ];

  @override
  WidgetBuilder get page => (context) => ManejoPage(presenter: context.get());
}
