import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/loader.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/messages.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/descarte/descarte_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/descarte/view/descarte_view.dart';

abstract class DescarteViewImpl extends State<DescartePage>
    with Message<DescartePage>, Loader<DescartePage>
    implements DescarteView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  final formKey = GlobalKey<FormState>();

  String? option;
  DateTime dateTime = DateTime.now();
  String date = '';
  final TextEditingController dateController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController weigthController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController observationsController = TextEditingController();

  void showDatePickerFunc() async {
    await showDatePicker(
      context: context,
      locale: const Locale("pt"),
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    ).then((value) {
      setState(() => dateTime = value!);
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
