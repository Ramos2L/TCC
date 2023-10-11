import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/loader.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/messages.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/observacoes/observacoes_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/observacoes/view/observacoes_view.dart';

abstract class ObservacoesViewImpl extends State<ObservacoesPage>
    with Message<ObservacoesPage>, Loader<ObservacoesPage>
    implements ObservacoesView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  final formKey = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();
  String date = '';
  final TextEditingController dateController = TextEditingController();
  final TextEditingController numberAnimalController = TextEditingController();
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
      setState(() => dateTime = value!);
      return null;
    });
  }

  @override
  void message(String message) {
    hideLoader();
    showCustomSnackBar(message);
  }

  @override
  void success(String message) {
    hideLoader();
    showCustomSnackBar(message, color: context.colors.surfaceTint);
    Navigator.pop(context);
  }
}
