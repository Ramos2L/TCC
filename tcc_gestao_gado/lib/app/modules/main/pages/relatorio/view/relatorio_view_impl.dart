import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/relatorio_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/view/relatorio_view.dart';

abstract class RelatorioViewImpl extends State<RelatorioPage> implements RelatorioView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
