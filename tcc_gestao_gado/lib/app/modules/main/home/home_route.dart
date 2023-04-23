import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/home/home_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/home/presenter/home_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/home/presenter/home_presenter_impl.dart';

class HomeRoute extends FlutterGetItPageRoute {
  const HomeRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<HomePresenter>((i) => HomePresenterImpl(userStore: i())),
      ];

  @override
  WidgetBuilder get page => (context) => HomePage(presenter: context.get());
}
