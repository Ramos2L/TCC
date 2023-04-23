import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/manejo_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/view/manejo_view.dart';

abstract class ManejoViewImpl extends State<ManejoPage> implements ManejoView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
