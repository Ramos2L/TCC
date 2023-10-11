import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/login_page.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/presenter/login_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/presenter/login_presenter_impl.dart';

class LoginRoute extends FlutterGetItPageRoute {
  const LoginRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<LoginPresenter>((i) => LoginPresenterImpl(
              loginRepository: i(),
            )),
      ];

  @override
  WidgetBuilder get page => (context) => LoginPage(presenter: context.get());
}
