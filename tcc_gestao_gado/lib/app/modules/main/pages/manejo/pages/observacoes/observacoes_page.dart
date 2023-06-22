import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/observacoes/presenter/observacoes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/observacoes/view/observacoes_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class ObservacoesPage extends StatefulWidget {
  static const routeName = '/observacoes';
  final ObservacoesPresenter presenter;
  const ObservacoesPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<ObservacoesPage> createState() => _ObservacoesPageState();
}

class _ObservacoesPageState extends ObservacoesViewImpl {
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
                            'Anotação de Observação de animal',
                            style: context.textStyles.textMedium.copyWith(
                              color: context.colors.onPrimary,
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Quando se necessário anotar alguma observação a respeito de algum animal utilize os campos abaixo.',
                            style: context.textStyles.textMedium.copyWith(
                              color: context.colors.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 25),
                          GestureDetector(
                            onTap: showDatePickerFunc,
                            child: CustomTextField(
                              controller: dateController,
                              enabled: false,
                              label: 'Data do registro da observação',
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
                            controller: numberAnimalController,
                            hintText: 'Código do animal',
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
                              [
                                Validatorless.required("Campo obrigatório"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          CustomTextField(
                            controller: observationsController,
                            hintText: 'Observações (optativo)',
                            labelStyle: TextStyle(color: context.colors.background),
                            inputDecoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 14, color: context.colors.error),
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            maxLength: 50,
                            onFieldSubmitted: (_) => registerAnnotation(),
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
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Button.primary(
                        label: 'SALVAR',
                        onPressed: () => registerAnnotation(),
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

  void registerAnnotation() {
    if (formKey.currentState!.validate()) {
      widget.presenter.updateAnnotation(
        dateObs: DateFormat("dd/MM/yyyy").format(dateTime),
        numberAnimal: numberAnimalController.text,
        observations: observationsController.text,
      );
    } else {
      //MENSAGEM DE ERRO
      showCustomSnackBar("Opss! Preencha todos os dados!");
    }
  }
}
