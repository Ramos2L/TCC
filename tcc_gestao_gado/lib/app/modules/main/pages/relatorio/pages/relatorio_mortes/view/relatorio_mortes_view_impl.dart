import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/relatorio_mortes_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/view/relatorio_mortes_view.dart';

abstract class RelatorioMortesViewImpl extends State<RelatorioMortesPage>
    implements RelatorioMortesView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
