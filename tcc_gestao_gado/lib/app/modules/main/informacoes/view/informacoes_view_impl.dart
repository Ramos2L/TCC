import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/informacoes_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/view/informacoes_view.dart';

abstract class InformacoesViewImpl extends State<InformacoesPage> implements InformacoesView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
