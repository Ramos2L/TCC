import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/dicas_manejo_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/model/dicas_manejo_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/view/dicas_manejo_view.dart';

abstract class DicasManejoViewImpl extends State<DicasManejoPage> implements DicasManejoView {
  bool isActive = false;
  List<String> listDataManagementTips = [];

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
  List<String> showDataManagementTips(DicasManejoModel listData) {
    listDataManagementTips = [
      listData.imagem,
      listData.informacao1,
      listData.informacao2,
      listData.informacao3
    ];
    return listDataManagementTips;
  }
}
