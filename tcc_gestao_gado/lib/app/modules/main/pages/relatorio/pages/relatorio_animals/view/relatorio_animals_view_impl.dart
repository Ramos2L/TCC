import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_animals/relatorio_animals_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_animals/view/relatorio_animals_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/widgets/pdf_widget.dart';

abstract class RelatorioAnimalsViewImpl extends State<RelatorioAnimalsPage>
    implements RelatorioAnimalsView {
  bool active = false;
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (await widget.presenter.getAnimalsReport()) active = true;

      setState(() {});
    });
  }

  toScreenPDF({required String path}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PDFScreen(path: path)));
  }

  List<CattleModel> listAnimals = [];

  @override
  void showAnimalsList({required List<CattleModel> animalsList}) {
    listAnimals = animalsList;
  }
}
