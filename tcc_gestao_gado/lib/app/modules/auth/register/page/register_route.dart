import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/presenter/register_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/presenter/register_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/register_page.dart';

class RegisterRoute extends FlutterGetItPageRoute {
  const RegisterRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RegisterPresenter>((i) => RegisterPresenterImpl(
              registerRepository: i(),
              userStore: i(),
            )),
      ];

  @override
  WidgetBuilder get page => (context) => RegisterPage(presenter: context.get());
}
