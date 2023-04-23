import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/nascimento/nascimento_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/nascimento/view/nascimento_view.dart';

abstract class NascimentoViewImpl extends State<NascimentoPage> implements NascimentoView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
