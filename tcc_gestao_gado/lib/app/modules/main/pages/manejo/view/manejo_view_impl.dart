import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/manejo_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/view/manejo_view.dart';

abstract class ManejoViewImpl extends State<ManejoPage> implements ManejoView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
