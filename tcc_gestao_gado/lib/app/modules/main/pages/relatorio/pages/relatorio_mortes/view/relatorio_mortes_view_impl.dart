import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/mortes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/relatorio_mortes_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/view/relatorio_mortes_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/widgets/pdf_widget.dart';

abstract class RelatorioMortesViewImpl extends State<RelatorioMortesPage>
    implements RelatorioMortesView {
  bool active = false;
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (await widget.presenter.getDeathReport()) active = true;

      setState(() {});
    });
  }

  toScreenPDF({required String path}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PDFScreen(path: path)));
  }

  List<MortesModel> listDeath = [];

  @override
  void showDeathList({required List<MortesModel> deathList}) {
    listDeath = deathList;
  }
}
