import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/messages.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/pesagem/pesagem_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/pesagem/view/pesagem_view.dart';

abstract class PesagemViewImpl extends State<PesagemPage>
    with Message<PesagemPage>
    implements PesagemView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  DateTime dateTime = DateTime.now();
  String date = '';
  final TextEditingController dateController = TextEditingController();
  final TextEditingController numberAnimalController = TextEditingController();
  final TextEditingController weigthController = TextEditingController();
  final TextEditingController observationsController = TextEditingController();

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
        //print(value);
      });
      return null;
    });
  }

  @override
  void message(String message) {
    showCustomSnackBar(message);
  }

  @override
  void success(String message) {
    showCustomSnackBar(message, color: context.colors.surfaceTint);
    Navigator.pop(context);
  }
}
