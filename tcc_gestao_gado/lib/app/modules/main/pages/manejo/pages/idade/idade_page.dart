import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/idade/presenter/idade_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/idade/view/idade_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class IdadePage extends StatefulWidget {
  static const routeName = '/idade';
  final IdadePresenter presenter;
  const IdadePage({super.key, required this.presenter});

  @override
  State<IdadePage> createState() => _IdadePageState();
}

class _IdadePageState extends IdadeViewImpl {
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
                            'Alterar idade do animal',
                            style: context.textStyles.textMedium.copyWith(
                              color: context.colors.onPrimary,
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
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
                            controller: ageController,
                            hintText: 'Idade do animal',
                            labelStyle: TextStyle(color: context.colors.background),
                            inputDecoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 14, color: context.colors.error),
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            maxLength: 3,
                            onFieldSubmitted: (_) => registerAge(),
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
                        onPressed: () => registerAge(),
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

  void registerAge() {
    if (formKey.currentState!.validate()) {
      widget.presenter.updateAgeCattle(
        numberController: numberAnimalController.text,
        ageCattle: ageController.text,
      );
    } else {
      //MENSAGEM DE ERRO
      showCustomSnackBar("Opss! Preencha todos os dados!");
    }
  }
}
