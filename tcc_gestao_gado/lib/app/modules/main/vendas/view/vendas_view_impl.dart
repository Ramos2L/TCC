import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/vendas/vendas_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/vendas/view/vendas_view.dart';

abstract class VendasViewImpl extends State<VendasPage> implements VendasView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
