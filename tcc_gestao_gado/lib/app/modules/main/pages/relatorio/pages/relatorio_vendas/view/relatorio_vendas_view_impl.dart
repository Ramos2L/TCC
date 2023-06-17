import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/vendas_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_vendas/relatorio_vendas_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_vendas/view/relatorio_vendas_view.dart';

abstract class RelatorioVendasViewImpl extends State<RelatorioVendasPage>
    implements RelatorioVendasView {
  bool active = false;
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (await widget.presenter.getSalesReport()) active = true;

      setState(() {});
    });
  }

  List<VendasModel> listSales = [];

  @override
  void showSalesList({required List<VendasModel> salesList}) {
    listSales = salesList;
  }
}
