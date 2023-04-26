import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/cadastro_animal_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/view/cadastro_animal_view.dart';

List<String> list = [];

abstract class CadastroAnimalViewImpl extends State<CadastroAnimalPage>
    implements CadastroAnimalView {
  final TextEditingController dateController = TextEditingController();
  DateTime dateTime = DateTime.now();
  String date = '';

  String? dropdownValue;
  String? breastfeeding;
  String? gender;
  String? quite;

  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
    SchedulerBinding.instance.addPostFrameCallback((timestamp) async {
      await widget.presenter.getListRaca();
      setState(() {});
    });
  }

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

  @override
  Future<void> getShowListRaca(List<RacaModel> raca) async {
    list.clear();
    for (int i = 0; i < raca[0].nome!.length; i++) {
      list.add(raca[0].nome![i]);
    }
  }
}
