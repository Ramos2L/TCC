import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/pasto/pasto_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pasto/view/pasto_view.dart';

abstract class PastoViewImpl extends State<PastoPage> implements PastoView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
