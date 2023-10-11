import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/presenter/recuperate_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/view/recuperate_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class RecuperatePage extends StatefulWidget {
  static const routeName = '/recuperate';
  final RecuperatePresenter presenter;
  const RecuperatePage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<RecuperatePage> createState() => _RecuperatePageState();
}

class _RecuperatePageState extends RecuperateViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: SafeArea(
        child: Form(
          key: form,
          child: CustomScrollView(
            scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          CircleAvatarWidget(
                            width: 125,
                            height: 125,
                            image: context.images.splashImage,
                          ),
                          const SizedBox(height: 25),
                          Text(
                            "CATTLECONTROL",
                            style: context.textStyles.textRegular.copyWith(
                              color: context.colors.onSecondary,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 50),
                          CustomTextField(
                            padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                            controller: controllerEmail,
                            label: 'e-mail',
                            labelStyle: TextStyle(color: context.colors.background),
                            inputDecoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 14, color: context.colors.error),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[\S]')),
                            ],
                            keyboardType: TextInputType.emailAddress,
                            validator: Validatorless.multiple(
                              [
                                Validatorless.required("Obrigatório"),
                                Validatorless.email("e-mail inválido")
                              ],
                            ),
                            textInputAction: TextInputAction.next,
                            suffixIcon: const Icon(Icons.person),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button.primary(label: 'ENVIAR EMAIL', onPressed: () => validateData()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateData() {
    if (form.currentState!.validate()) {
      widget.presenter.recuperatePassword(email: controllerEmail.text);
    }
  }
}
