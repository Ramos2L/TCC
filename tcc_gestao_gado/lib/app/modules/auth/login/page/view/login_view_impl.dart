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

  final form = GlobalKey<FormState>();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  bool canPop = false;
  bool activateIconPassword = false;

  @override
  void loginUser() {
    Navigator.pushNamed(context, '/home');
  }

  @override
  void toRegisterPage() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  void error(String message) {
    showCustomSnackBar(message);
  }

  @override
  void showDialog() {
    showCustomDialog(
      'Hey! Deseja voltar no início da aplicação?',
      textPrimaryButton: 'não',
      textSecondaryButton: 'sim',
      onPressedPrimaryButton: () => Navigator.of(context).pop(),
      onPressedSecondaryButton: () {
        canPop = true;
        Navigator.pop(context, true);
        Navigator.popAndPushNamed(context, '/');
      },
    );
  }
}
