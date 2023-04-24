import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/informacoes_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/model/informacoes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/view/informacoes_view.dart';

abstract class InformacoesViewImpl extends State<InformacoesPage> implements InformacoesView {
  bool isActive = false;
  List<String> listData = [];
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;

    SchedulerBinding.instance.addPostFrameCallback((timestamp) async {
      isActive = await widget.presenter.getData();
      setState(() {});
    });
  }

  @override
  List<String> showDataInformation(InformacoesModel listInformation) {
    listData = [
      listInformation.imagem,
      listInformation.informacao1,
      listInformation.informacao2,
      listInformation.informacao3
    ];
    return listData;
  }
}
