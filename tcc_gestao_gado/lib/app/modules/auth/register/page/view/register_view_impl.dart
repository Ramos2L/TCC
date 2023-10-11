import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/loader.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/messages.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/register_page.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/view/register_view.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Message<RegisterPage>, Loader<RegisterPage>
    implements RegisterView {
  bool activeIconPassword = false;
  bool activeIconPasswordRepeat = false;

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController farmController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  void cadastroSucesso() {
    hideLoader();
    Navigator.pushNamed(context, '/login');
  }

  @override
  void error(String message) {
    hideLoader();
    showCustomSnackBar(message);
  }
}
