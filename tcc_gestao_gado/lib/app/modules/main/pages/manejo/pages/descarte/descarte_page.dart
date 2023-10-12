import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/descarte/presenter/descarte_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/descarte/view/descarte_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class DescartePage extends StatefulWidget {
  static const routeName = '/descarte';
  final DescartePresenter presenter;
  const DescartePage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<DescartePage> createState() => _DescartePageState();
}

class _DescartePageState extends DescarteViewImpl {
  @override
  Widget build(BuildContext context) {
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
                            'Descarte do animal',
                            style: context.textStyles.textMedium.copyWith(
                              fontSize: 20,
                              color: context.colors.onPrimary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'O descarte do animal ocorre em caso de morte ou venda do mesmo',
                            style: context.textStyles.textMedium.copyWith(
                              color: context.colors.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Situação:',
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
                                    'morte',
                                    style: context.textStyles.textMedium.copyWith(
                                      fontSize: 16,
                                      color: context.colors.onPrimary,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  value: "morte",
                                  groupValue: option,
                                  onChanged: (value) {
                                    setState(() {
                                      option = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: Text(
                                    'venda',
                                    style: context.textStyles.textMedium.copyWith(
                                      fontSize: 16,
                                      color: context.colors.onPrimary,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  value: "venda",
                                  groupValue: option,
                                  onChanged: (value) {
                                    setState(() {
                                      option = value.toString();
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
                              label: 'Data do descarte',
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
                          CustomTextField(
                            controller: codeController,
                            hintText: 'Código do animal',
                            labelStyle: TextStyle(color: context.colors.background),
                            inputDecoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 14,
                                color: context.colors.error,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            suffixIcon: const Icon(Icons.app_registration_rounded),
                            validator: Validatorless.multiple(
                              [Validatorless.required("Campo obrigatório")],
                            ),
                            textInputAction:
                                option == "morte" ? TextInputAction.done : TextInputAction.next,
                            onFieldSubmitted: option == "morte" ? (_) => descarteDados() : (_) {},
                          ),
                          const SizedBox(height: 25),
                          option == "venda"
                              ? Column(
                                  children: [
                                    CustomTextField(
                                      controller: weigthController,
                                      hintText: 'Peso do animal (kg)',
                                      labelStyle: TextStyle(color: context.colors.background),
                                      inputDecoration: InputDecoration(
                                        errorStyle: TextStyle(
                                          fontSize: 14,
                                          color: context.colors.error,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      obscureText: false,
                                      suffixIcon: const Icon(Icons.balance),
                                      textInputAction: TextInputAction.next,
                                      validator: Validatorless.multiple(
                                        [Validatorless.required("Campo obrigatório")],
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    CustomTextField(
                                      controller: priceController,
                                      hintText: 'Preço',
                                      labelStyle: TextStyle(color: context.colors.background),
                                      inputDecoration: InputDecoration(
                                        errorStyle: TextStyle(
                                          fontSize: 14,
                                          color: context.colors.error,
                                        ),
                                      ),
                                      validator: Validatorless.multiple(
                                        [Validatorless.required("Campo obrigatório")],
                                      ),
                                      keyboardType: TextInputType.number,
                                      obscureText: false,
                                      textInputAction: TextInputAction.next,
                                      suffixIcon: const Icon(Icons.money),
                                    ),
                                    const SizedBox(height: 25),
                                  ],
                                )
                              : const SizedBox(),
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
                            maxLength: 50,
                            onFieldSubmitted: (_) => descarteDados(),
                          ),
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
                        onPressed: () => descarteDados(),
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

  void descarteDados() {
    if (formKey.currentState!.validate()) {
      widget.presenter.registerDiscard(
        situation: option.toString(),
        idAnimal: codeController.text,
        date: DateFormat("dd/MM/yyyy").format(dateTime),
        weigth: weigthController.text,
        price: priceController.text,
        observations: observationsController.text,
      );
    } else {
      //MENSAGEM DE ERRO
      showCustomSnackBar("Opss! Preencha todos os dados!");
    }
  }
}