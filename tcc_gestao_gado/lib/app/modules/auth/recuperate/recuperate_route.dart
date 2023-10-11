import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/presenter/recuperate_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/presenter/recuperate_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/recuperate_page.dart';

class RecuperateRoute extends FlutterGetItPageRoute {
  const RecuperateRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RecuperatePresenter>((i) => RecuperatePresenterImpl(
              recuperateRepository: i(),
            )),
      ];

  @override
  WidgetBuilder get page => (context) => RecuperatePage(presenter: context.get());
}
