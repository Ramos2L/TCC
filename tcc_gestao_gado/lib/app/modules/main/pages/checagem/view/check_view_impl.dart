import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/checagem/check_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/checagem/view/check_view.dart';

abstract class CheckViewImpl extends State<CheckPage> implements CheckView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  void toHome() {
    Navigator.pushNamed(context, '/home');
  }
}
