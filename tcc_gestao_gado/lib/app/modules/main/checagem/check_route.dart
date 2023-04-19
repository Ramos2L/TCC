import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/checagem/check_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/checagem/presenter/check_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/checagem/presenter/check_presenter_impl.dart';

class CheckRoute extends FlutterGetItPageRoute {
  const CheckRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<CheckPresenter>((i) => CheckPresenterImpl(
              userStore: i(),
              firebaseFirestore: i(),
            )),
      ];

  @override
  WidgetBuilder get page => (context) => CheckPage(presenter: context.get());
}
