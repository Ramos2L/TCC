import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_pesagens/relatorio_pesagens_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_pesagens/view/relatorio_pesagens_view.dart';

abstract class RelatorioPesagensViewImpl extends State<RelatorioPesagensPage>
    implements RelatorioPesagensView {
  bool active = false;
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (await widget.presenter.getWeighingsReport()) active = true;

      setState(() {});
    });
  }

  List<CattleModel> listWeighings = [];

  @override
  void showWeighingsList({required List<CattleModel> weighingsList}) {
    listWeighings = weighingsList;
  }
}
