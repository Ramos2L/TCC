import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/descarte/descarte_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/descarte/presenter/descarte_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/descarte/presenter/descarte_presenter_impl.dart';

class DescarteRoute extends FlutterGetItPageRoute {
  const DescarteRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<DescartePresenter>((i) => DescartePresenterImpl(
              firebaseAuth: i(),
              mainRepository: i(),
            )),
      ];

  @override
  WidgetBuilder get page => (context) => DescartePage(presenter: context.get());
}
