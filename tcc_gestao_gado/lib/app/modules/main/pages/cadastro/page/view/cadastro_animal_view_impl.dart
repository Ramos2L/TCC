import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/loader.dart';
import 'package:tcc_gestao_gado/app/core/ui/helpers/messages.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/cadastro_animal_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/view/cadastro_animal_view.dart';

abstract class CadastroAnimalViewImpl extends State<CadastroAnimalPage>
    with Message<CadastroAnimalPage>, Loader<CadastroAnimalPage>
    implements CadastroAnimalView {
  List<String> list = [];
  final formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController numberMotherController = TextEditingController();
  final TextEditingController numberFatherController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController observationsController = TextEditingController();

  ImagePicker imagePicker = ImagePicker();
  File? image;

  DateTime dateTime = DateTime.now();
  String date = '';

  String? dropdownValue;
  String? breastfeeding;
  bool? breastfeedingOption = false;
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

  captureImageGallery() async {
    final XFile? imageTemporary = await imagePicker.pickImage(source: ImageSource.gallery);

    if (imageTemporary != null) {
      setState(() {
        image = File(imageTemporary.path);
      });
    }
  }

  captureImageCamera() async {
    final XFile? imageTemporary = await imagePicker.pickImage(source: ImageSource.camera);

    if (imageTemporary != null) {
      setState(() {
        image = File(imageTemporary.path);
      });
    }
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
  void successRegister() {
    hideLoader();
    showCustomSnackBar('Cadastrado com sucesso!', color: context.colors.surfaceTint);
    Navigator.pop(context);
  }

  @override
  void errorRegister() {
    hideLoader();
    showCustomSnackBar('Código já utilizado por outro animal!');
  }

  @override
  Future<void> getShowListRaca(List<RacaModel> raca) async {
    list.clear();
    for (int i = 0; i < raca[0].nome!.length; i++) {
      list.add(raca[0].nome![i]);
    }
  }
}
