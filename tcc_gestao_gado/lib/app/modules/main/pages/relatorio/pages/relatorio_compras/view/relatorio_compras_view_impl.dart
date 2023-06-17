import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_compras/relatorio_compras_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_compras/view/relatorio_compras_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/compras_model.dart';

abstract class RelatorioComprasViewImpl extends State<RelatorioComprasPage>
    implements RelatorioComprasView {
  bool active = false;
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (await widget.presenter.getAnimalsBoughtReport()) active = true;

      setState(() {});
    });
  }

  List<ComprasModel> listAnimals = [];

  @override
  void showAnimalsBoughtList({required List<ComprasModel> animalsList}) {
    listAnimals = animalsList;
  }
}
