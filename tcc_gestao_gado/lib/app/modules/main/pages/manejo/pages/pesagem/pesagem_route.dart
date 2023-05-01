import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/pesagem/pesagem_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/pesagem/presenter/pesagem_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/pesagem/presenter/pesagem_presenter_impl.dart';

class PesagemRoute extends FlutterGetItPageRoute {
  const PesagemRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<PesagemPresenter>(
            (i) => PesagemPresenterImpl(mainRepository: i(), firebaseAuth: i())),
      ];

  @override
  WidgetBuilder get page => (context) => PesagemPage(presenter: context.get());
}
