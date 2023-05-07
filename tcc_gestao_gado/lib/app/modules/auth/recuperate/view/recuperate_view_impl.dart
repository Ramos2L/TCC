import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/loader.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/messages.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/recuperate_page.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/view/recuperate_view.dart';

abstract class RecuperateViewImpl extends State<RecuperatePage>
    with Message<RecuperatePage>, Loader<RecuperatePage>
    implements RecuperateView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  final form = GlobalKey<FormState>();
  final TextEditingController controllerEmail = TextEditingController();

  @override
  void loginUser(String message) {
    hideLoader();
    showCustomSnackBar(message);
    Navigator.pushNamed(context, '/login');
  }

  @override
  void error(String message) {
    hideLoader();
    showCustomSnackBar(message);
  }
}
