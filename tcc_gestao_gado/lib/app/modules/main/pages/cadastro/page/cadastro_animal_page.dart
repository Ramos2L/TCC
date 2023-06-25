import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/cadastro_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/presenter/cadastro_animal_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/view/cadastro_animal_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class CadastroAnimalPage extends StatefulWidget {
  static const routeName = '/cadastro_animal';
  final CadastroAnimalPresenter presenter;
  const CadastroAnimalPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<CadastroAnimalPage> createState() => _CadastroAnimalPageState();
}

class _CadastroAnimalPageState extends CadastroAnimalViewImpl {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    return Scaffold(
      backgroundColor: context.colors.primary,
      drawer: const DrawerMenu(),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: CustomScrollView(
            scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Row(
                              children: [
                                Icon(
                                  color: context.colors.onPrimary,
                                  Icons.arrow_back_rounded,
                                  size: 35,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Cadastro dos animais',
                            style: context.textStyles.textMedium.copyWith(
                              fontSize: 20,
                              color: context.colors.onPrimary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Tire ou envie uma foto',
                            style: context.textStyles.textRegular.copyWith(
                              fontSize: 16,
                              color: context.colors.onPrimary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 15),
                          image == null
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.colors.onPrimary,
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          captureImageCamera();
                                        },
                                        icon: Icon(
                                          Icons.camera_alt_rounded,
                                          color: context.colors.onPrimary,
                                        ),
                                        iconSize: 60,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          captureImageGallery();
                                        },
                                        icon: Icon(
                                          Icons.add_photo_alternate_rounded,
                                          color: context.colors.onPrimary,
                                        ),
                                        iconSize: 60,
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.colors.onPrimary,
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            image = null;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width,
                                            height: 200,
                                            child: Image.file(
                                              image!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: SizedBox(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                image = null;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.refresh_rounded,
                                              color: context.colors.onPrimary.withOpacity(0.5),
                                            ),
                                            iconSize: 60,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          const SizedBox(height: 25),
                          args.animal == 'Bezerro'
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Sexo:',
                                          style: context.textStyles.textMedium.copyWith(
                                            fontSize: 20,
                                            color: context.colors.onPrimary,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            contentPadding: const EdgeInsets.all(0),
                                            title: Text(
                                              'Macho',
                                              style: context.textStyles.textMedium.copyWith(
                                                fontSize: 16,
                                                color: context.colors.onPrimary,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            value: "macho",
                                            groupValue: gender,
                                            onChanged: (value) {
                                              setState(() => gender = value.toString());
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            contentPadding: const EdgeInsets.all(0),
                                            title: Text(
                                              'Fêmea',
                                              style: context.textStyles.textMedium.copyWith(
                                                fontSize: 16,
                                                color: context.colors.onPrimary,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            value: "femea",
                                            groupValue: gender,
                                            onChanged: (value) {
                                              setState(() => gender = value.toString());
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Meio:',
                                          style: context.textStyles.textMedium.copyWith(
                                            fontSize: 20,
                                            color: context.colors.onPrimary,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            contentPadding: const EdgeInsets.all(0),
                                            title: Text(
                                              'Compra',
                                              style: context.textStyles.textMedium.copyWith(
                                                fontSize: 16,
                                                color: context.colors.onPrimary,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            value: "Compra",
                                            groupValue: quite,
                                            onChanged: (value) {
                                              setState(() => quite = value.toString());
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            contentPadding: const EdgeInsets.all(0),
                                            title: Text(
                                              'Nascimento',
                                              style: context.textStyles.textMedium.copyWith(
                                                fontSize: 16,
                                                color: context.colors.onPrimary,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            value: "Nascimento",
                                            groupValue: quite,
                                            onChanged: (value) {
                                              setState(() => quite = value.toString());
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    quite == 'Nascimento'
                                        ? Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Amamentando:',
                                                style: context.textStyles.textMedium.copyWith(
                                                  fontSize: 20,
                                                  color: context.colors.onPrimary,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  contentPadding: const EdgeInsets.all(0),
                                                  title: Text(
                                                    'Sim',
                                                    style: context.textStyles.textMedium.copyWith(
                                                      fontSize: 16,
                                                      color: context.colors.onPrimary,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  value: "Sim",
                                                  groupValue: breastfeeding,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      breastfeeding = value.toString();
                                                      breastfeedingOption = true;
                                                    });
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  contentPadding: const EdgeInsets.all(0),
                                                  title: Text(
                                                    'Não',
                                                    style: context.textStyles.textMedium.copyWith(
                                                      fontSize: 16,
                                                      color: context.colors.onPrimary,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  value: "Não",
                                                  groupValue: breastfeeding,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      breastfeeding = value.toString();
                                                      breastfeedingOption = false;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                                  ],
                                )
                              : const SizedBox(),
                          CustomTextField(
                            controller: numberController,
                            hintText: 'Nº ${args.animal}',
                            labelStyle: TextStyle(color: context.colors.background),
                            inputDecoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 14,
                                color: context.colors.error,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            suffixIcon: const Icon(Icons.app_registration_rounded),
                            validator: Validatorless.multiple(
                              [Validatorless.required("Campo obrigatório")],
                            ),
                          ),
                          const SizedBox(height: 25),
                          GestureDetector(
                            onTap: showDatePickerFunc,
                            child: CustomTextField(
                              controller: dateController,
                              enabled: false,
                              label: args.animal == 'Bezerro'
                                  ? 'Escolha a data de nascimento'
                                  : 'Data para cadastro',
                              hintText: DateFormat("dd/MM/yyyy").format(dateTime),
                              labelStyle: TextStyle(color: context.colors.background),
                              inputDecoration: InputDecoration(
                                errorStyle: TextStyle(
                                  fontSize: 14,
                                  color: context.colors.error,
                                ),
                              ),
                              keyboardType: TextInputType.datetime,
                              obscureText: false,
                              suffixIcon: const Icon(Icons.calendar_month),
                            ),
                          ),
                          const SizedBox(height: 25),
                          args.animal == 'Bezerro'
                              ? Column(
                                  children: [
                                    CustomTextField(
                                      controller: numberMotherController,
                                      hintText: 'Nº da mãe',
                                      labelStyle: TextStyle(color: context.colors.background),
                                      inputDecoration: InputDecoration(
                                        errorStyle: TextStyle(
                                          fontSize: 14,
                                          color: context.colors.error,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      suffixIcon: const Icon(Icons.app_registration_rounded),
                                    ),
                                    const SizedBox(height: 25),
                                    CustomTextField(
                                      controller: numberFatherController,
                                      hintText: 'Nº do pai',
                                      labelStyle: TextStyle(color: context.colors.background),
                                      inputDecoration: InputDecoration(
                                        errorStyle: TextStyle(
                                          fontSize: 14,
                                          color: context.colors.error,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      suffixIcon: const Icon(Icons.app_registration_rounded),
                                    ),
                                    const SizedBox(height: 25),
                                  ],
                                )
                              : const SizedBox(),
                          CustomTextField(
                            controller: weightController,
                            hintText: 'Peso do animal (kg)',
                            labelStyle: TextStyle(color: context.colors.background),
                            inputDecoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 14,
                                color: context.colors.error,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            suffixIcon: const Icon(Icons.balance),
                            validator: Validatorless.multiple(
                              [Validatorless.required("Campo obrigatório")],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: context.colors.onPrimary,
                              border: Border.all(color: context.colors.secondary, width: 3),
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButton<String>(
                                hint: const Text("Escolha a Raça"),
                                value: dropdownValue,
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: TextStyle(color: context.colors.secondary, fontSize: 16),
                                underline: Container(height: 0),
                                onChanged: (String? value) {
                                  setState(() => dropdownValue = value!);
                                },
                                items: list.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          CustomTextField(
                            controller: observationsController,
                            hintText: 'Observações (optativo)',
                            labelStyle: TextStyle(color: context.colors.background),
                            inputDecoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 14,
                                color: context.colors.error,
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            onFieldSubmitted: (_) => registerCattle(args.animal),
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Button.primary(
                        label: 'SALVAR',
                        onPressed: () => registerCattle(args.animal),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registerCattle(String animalType) {
    if (formKey.currentState!.validate() && dropdownValue != null) {
      widget.presenter.registerCattle(
        gender: gender,
        quite: quite,
        breastfeedingOption: breastfeedingOption,
        numberController: numberController.text,
        dateController: DateFormat("dd/MM/yyyy").format(dateTime),
        numberMotherController: numberMotherController.text,
        numberFatherController: numberFatherController.text,
        weightController: weightController.text,
        dropdownValue: dropdownValue,
        type: animalType,
        observationsController: observationsController.text,
        path: image,
      );
    } else {
      //MENSAGEM DE ERRO
      if (dropdownValue == null) {
        showCustomSnackBar("Por favor, escolha a raça!");
      } else {
        showCustomSnackBar("Opss! Algo deu errado");
      }
    }
  }
}
