import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/desmama/desmama_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/desmama/presenter/desmama_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/desmama/presenter/desmama_presenter_impl.dart';

class DesmamaRoute extends FlutterGetItPageRoute {
  const DesmamaRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<DesmamaPresenter>(
            (i) => DesmamaPresenterImpl(mainRepository: i(), firebaseAuth: i())),
      ];

  @override
  WidgetBuilder get page => (context) => DesmamaPage(presenter: context.get());
}
