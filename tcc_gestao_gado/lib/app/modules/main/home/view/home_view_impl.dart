import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/messages.dart';
import 'package:tcc_gestao_gado/app/modules/main/home/home_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/home/view/home_view.dart';

abstract class HomeViewImpl extends State<HomePage> with Message<HomePage> implements HomeView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  bool canPop = false;

  @override
  void showDialog() {
    showCustomDialog(
      'Hey! Deseja voltar no início da aplicação?',
      textPrimaryButton: 'não',
      textSecondaryButton: 'sim',
      onPressedPrimaryButton: () => Navigator.of(context).pop(),
      onPressedSecondaryButton: () {
        canPop = true;
        Navigator.pop(context, true);
        Navigator.popAndPushNamed(context, '/login');
      },
    );
  }
}
