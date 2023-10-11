import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/castrar/castrar_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/castrar/presenter/castrar_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/castrar/presenter/castrar_presenter_impl.dart';

class CastrarRoute extends FlutterGetItPageRoute {
  const CastrarRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<CastrarPresenter>(
            (i) => CastrarPresenterImpl(mainRepository: i(), firebaseAuth: i())),
      ];

  @override
  WidgetBuilder get page => (context) => CastrarPage(presenter: context.get());
}
