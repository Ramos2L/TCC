import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/conta/conta_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/conta/view/conta_view.dart';

abstract class ContaViewImpl extends State<ContaPage> implements ContaView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
