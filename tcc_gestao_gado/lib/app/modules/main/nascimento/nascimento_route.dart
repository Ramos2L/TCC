import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/nascimento/nascimento_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/nascimento/presenter/nascimento_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/nascimento/presenter/nascimento_presenter_impl.dart';

class NascimentoRoute extends FlutterGetItPageRoute {
  const NascimentoRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<NascimentoPresenter>((i) => NascimentoPresenterImpl(userStore: i())),
      ];

  @override
  WidgetBuilder get page => (context) => NascimentoPage(presenter: context.get());
}
