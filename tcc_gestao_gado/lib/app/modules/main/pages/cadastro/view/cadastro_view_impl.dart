import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/cadastro_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/view/cadastro_view.dart';

abstract class CadastroViewImpl extends State<CadastroPage> implements CadastroView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }
}
