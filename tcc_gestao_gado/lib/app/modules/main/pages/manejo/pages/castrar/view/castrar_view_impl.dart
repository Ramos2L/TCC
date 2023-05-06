import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/loader.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/messages.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/castrar/castrar_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/castrar/view/castrar_view.dart';

abstract class CastrarViewImpl extends State<CastrarPage>
    with Message<CastrarPage>, Loader<CastrarPage>
    implements CastrarView {
  List<String> list = [];
  final formKey = GlobalKey<FormState>();

  TextEditingController dateController = TextEditingController();
  final TextEditingController numberAnimalController = TextEditingController();

  DateTime dateTime = DateTime.now();
  String date = '';

  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  void showDatePickerFunc() async {
    await showDatePicker(
      context: context,
      locale: const Locale("pt"),
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    ).then((value) {
      setState(() {
        dateTime = value!;
      });
      return null;
    });
  }

  @override
  void successCastrate() {
    hideLoader();
    showCustomSnackBar('Castrado com sucesso!', color: context.colors.surfaceTint);
    Navigator.pop(context);
  }

  @override
  void errorCastrate() {
    hideLoader();
    showCustomSnackBar('Código inválido!');
  }
}
