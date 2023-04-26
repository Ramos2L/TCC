import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/cadastro_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/presenter/cadastro_animal_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/view/cadastro_animal_view_impl.dart';
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
                            color: context.colors.onPrimary,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Meio:',
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
                                            'Compra',
                                            style: context.textStyles.textMedium.copyWith(
                                              color: context.colors.onPrimary,
                                              fontSize: 16,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          value: "Compra",
                                          groupValue: quite,
                                          onChanged: (value) {
                                            setState(() {
                                              quite = value.toString();
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                          contentPadding: const EdgeInsets.all(0),
                                          title: Text(
                                            'Nascimento',
                                            style: context.textStyles.textMedium.copyWith(
                                              color: context.colors.onPrimary,
                                              fontSize: 16,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          value: "Nascimento",
                                          groupValue: quite,
                                          onChanged: (value) {
                                            setState(() {
                                              quite = value.toString();
                                            });
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
                                                color: context.colors.onPrimary,
                                                fontSize: 20,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Expanded(
                                              child: RadioListTile(
                                                contentPadding: const EdgeInsets.all(0),
                                                title: Text(
                                                  'Sim',
                                                  style: context.textStyles.textMedium.copyWith(
                                                    color: context.colors.onPrimary,
                                                    fontSize: 16,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                value: "Sim",
                                                groupValue: breastfeeding,
                                                onChanged: (value) {
                                                  setState(() {
                                                    breastfeeding = value.toString();
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
                                                    color: context.colors.onPrimary,
                                                    fontSize: 16,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                value: "Não",
                                                groupValue: breastfeeding,
                                                onChanged: (value) {
                                                  setState(() {
                                                    breastfeeding = value.toString();
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
                          //controller: ,
                          hintText: 'Nº ${args.animal}',
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
                        GestureDetector(
                          onTap: showDatePickerFunc,
                          child: CustomTextField(
                            controller: dateController,
                            enabled: false,
                            label: args.animal == 'Bezerro'
                                ? 'Escolha a data de nascimento'
                                : 'Data para cadastro',
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
                        args.animal == 'Bezerro'
                            ? Column(
                                children: [
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
                                    hintText: 'Nº do pai',
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
                                ],
                              )
                            : const SizedBox(),
                        CustomTextField(
                          //controller: ,
                          hintText: 'Peso do animal (kg)',
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
                                setState(() {
                                  dropdownValue = value!;
                                });
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
                          //controller: ,
                          hintText: 'Observações (optativo)',
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
                      onPressed: () {
                        //Navigator.pushNamed(context, '/home');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
