import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/preco_arroba/preco_arroba_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/preco_arroba/presenter/preco_arroba_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/preco_arroba/presenter/preco_arroba_presenter_impl.dart';

class PrecoArrobaRoute extends FlutterGetItPageRoute {
  const PrecoArrobaRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<PrecoArrobaPresenter>((i) => PrecoArrobaPresenterImpl(userStore: i())),
      ];

  @override
  WidgetBuilder get page => (context) => PrecoArrobaPage(presenter: context.get());
}
