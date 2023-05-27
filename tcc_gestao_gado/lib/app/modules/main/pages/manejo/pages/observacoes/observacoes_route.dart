import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/observacoes/observacoes_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/observacoes/presenter/observacoes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/observacoes/presenter/observacoes_presenter_impl.dart';

class ObservacoesRoute extends FlutterGetItPageRoute {
  const ObservacoesRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<ObservacoesPresenter>(
            (i) => ObservacoesPresenterImpl(mainRepository: i(), firebaseAuth: i())),
      ];

  @override
  WidgetBuilder get page => (context) => ObservacoesPage(presenter: context.get());
}
