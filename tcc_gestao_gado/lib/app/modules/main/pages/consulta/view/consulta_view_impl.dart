import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/loader.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/messages.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/consulta_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/view/consulta_view.dart';

abstract class ConsultaViewImpl extends State<ConsultaPage>
    with Message<ConsultaPage>, Loader<ConsultaPage>
    implements ConsultaView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  TextEditingController codAnimalController = TextEditingController();

  List<CattleModel> cattleAnimal = [];

  @override
  consultCattle(CattleModel cattle) {
    hideLoader();
    cattleAnimal.clear();
    cattleAnimal.add(cattle);
  }

  @override
  void error(String message) {
    hideLoader();
    showCustomSnackBar(message);
  }
}
