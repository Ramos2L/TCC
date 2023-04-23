import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/consulta/consulta_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/consulta/view/consulta_view.dart';

abstract class ConsultaViewImpl extends State<ConsultaPage> implements ConsultaView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
