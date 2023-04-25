import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/desmama/desmama_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/desmama/view/desmama_view.dart';

abstract class DesmamaViewImpl extends State<DesmamaPage> implements DesmamaView {
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
