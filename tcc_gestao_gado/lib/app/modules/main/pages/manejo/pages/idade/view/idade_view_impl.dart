import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/loader.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/messages.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/idade/idade_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/idade/view/idade_view.dart';

abstract class IdadeViewImpl extends State<IdadePage>
    with Message<IdadePage>, Loader<IdadePage>
    implements IdadeView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController numberAnimalController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void successUpdateAge() {
    hideLoader();
    showCustomSnackBar('Alteração realizada com sucesso!', color: context.colors.surfaceTint);
    Navigator.pop(context);
  }

  @override
  void errorUpdateAge() {
    hideLoader();
    showCustomSnackBar('Código inválido!');
  }
}
