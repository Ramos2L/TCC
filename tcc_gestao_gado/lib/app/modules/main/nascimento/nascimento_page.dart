import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_principal.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/modules/main/nascimento/presenter/nascimento_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/nascimento/view/nascimento_view_impl.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/widgets/drawer_menu.dart';

class NascimentoPage extends StatefulWidget {
  static const routeName = '/nascimento';
  final NascimentoPresenter presenter;
  const NascimentoPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<NascimentoPage> createState() => _NascimentoPageState();
}

class _NascimentoPageState extends NascimentoViewImpl {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBarWidget.appBar(context, title: '${widget.presenter.getName()}'),
      drawer: DrawerMenu(nameUser: '${widget.presenter.getName()}'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              children: [
                const ContainerPrincipal(),
                const SizedBox(height: 25),
                Text(
                  'Nascimento',
                  style: context.textStyles.textMedium.copyWith(
                    color: context.colors.onPrimary,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sexo:',
                      style: context.textStyles.textMedium.copyWith(
                        color: context.colors.onPrimary,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Text(
                          'Macho',
                          style: context.textStyles.textMedium.copyWith(
                            color: context.colors.onPrimary,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        value: "macho",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Text(
                          'Fêmea',
                          style: context.textStyles.textMedium.copyWith(
                            color: context.colors.onPrimary,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        value: "femea",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: showDatePickerFunc,
                  child: CustomTextField(
                    controller: dateController,
                    enabled: false,
                    label: 'Data de Nascimento',
                    hintText: dateTime.toString().substring(0, 11),
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
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required("Campo obrigatório"),
                      ],
                    ),
                    // onFieldSubmitted: (_) {
                    //   FocusScope.of(context).requestFocus(phoneNode);
                    // },
                  ),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  //controller: ,
                  hintText: 'Nº da mãe',
                  labelStyle: TextStyle(color: context.colors.background),
                  inputDecoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 14,
                      color: context.colors.error,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  suffixIcon: const Icon(Icons.app_registration_rounded),
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(phoneNode);
                  // },
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  //controller: ,
                  hintText: 'Nº do bezerro',
                  labelStyle: TextStyle(color: context.colors.background),
                  inputDecoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 14,
                      color: context.colors.error,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  suffixIcon: const Icon(Icons.app_registration_rounded),
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(phoneNode);
                  // },
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  //controller: ,
                  hintText: 'Peso',
                  labelStyle: TextStyle(color: context.colors.background),
                  inputDecoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 14,
                      color: context.colors.error,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  suffixIcon: const Icon(Icons.balance),
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(phoneNode);
                  // },
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  //controller: ,
                  hintText: 'Raça',
                  labelStyle: TextStyle(color: context.colors.background),
                  inputDecoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 14,
                      color: context.colors.error,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  suffixIcon: const Icon(Icons.add_to_photos_outlined),
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(phoneNode);
                  // },
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  //controller: ,
                  hintText: 'Informações',
                  labelStyle: TextStyle(color: context.colors.background),
                  inputDecoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 14,
                      color: context.colors.error,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(phoneNode);
                  // },
                ),
                const SizedBox(height: 25),
                Button.primary(
                  label: 'SALVAR',
                  onPressed: () {
                    //Navigator.pushNamed(context, '/home');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
