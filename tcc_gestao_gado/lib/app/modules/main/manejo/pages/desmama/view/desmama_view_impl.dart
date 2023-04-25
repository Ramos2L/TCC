import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/desmama/desmama_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/desmama/view/desmama_view.dart';

abstract class DesmamaViewImpl extends State<DesmamaPage> implements DesmamaView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
