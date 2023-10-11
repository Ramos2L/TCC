import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/preco_arroba/preco_arroba_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/preco_arroba/view/preco_arroba_view.dart';

abstract class PrecoArrobaViewImpl extends State<PrecoArrobaPage> implements PrecoArrobaView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  DateTime dateTime = DateTime.now();
  String date = '';
  final TextEditingController dateController = TextEditingController();

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
}
