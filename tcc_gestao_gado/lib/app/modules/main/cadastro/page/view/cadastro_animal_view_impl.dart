import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/cadastro_animal_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/view/cadastro_animal_view.dart';

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

abstract class CadastroAnimalViewImpl extends State<CadastroAnimalPage>
    implements CadastroAnimalView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  String? dropdownValue;

  String? gender;
  String? quite;
  String? breastfeeding;

  DateTime dateTime = DateTime.now();
  String date = '';
  final TextEditingController dateController = TextEditingController();

  @override
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
