import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/loader.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/messages.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/vendas/vendas_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/vendas/view/vendas_view.dart';

abstract class VendasViewImpl extends State<VendasPage>
    with Message<VendasPage>, Loader<VendasPage>
    implements VendasView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController numberAnimalController = TextEditingController();
  TextEditingController weigthController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController observationsController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime dateTime = DateTime.now();
  String date = '';

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
  void message(String message) {
    showCustomSnackBar(message);
  }

  @override
  void success(String message) {
    hideLoader();
    showCustomSnackBar(message, color: context.colors.surfaceTint);
    Navigator.pop(context);
  }
}
