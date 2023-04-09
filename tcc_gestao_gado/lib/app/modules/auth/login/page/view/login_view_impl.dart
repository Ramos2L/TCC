import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/messages.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/login_page.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/view/login_view.dart';

abstract class LoginViewImpl extends State<LoginPage> with Message<LoginPage> implements LoginView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  void loginUser() {
    Navigator.pushNamed(context, '/home');
  }

  @override
  void userNotFound() {
    showCustomSnackBar("Usuário informado não existe!");
  }

  @override
  void userPasswordIncorrect() {
    showCustomSnackBar("Senha informada incorreta!");
  }

  @override
  void genericError(String error) {
    showCustomSnackBar(error);
  }
}
