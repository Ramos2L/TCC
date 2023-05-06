import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/presenter/login_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/view/login_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  final LoginPresenter presenter;
  const LoginPage({super.key, required this.presenter});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (canPop) {
          return true;
        } else {
          widget.presenter.dialogFluxo();
          return false;
        }
      },
      child: Scaffold(
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
                              // onFieldSubmitted: (_) {
                              //   FocusScope.of(context).requestFocus(phoneNode);
                              // },
                            ),
                            CustomTextField(
                              padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                              controller: controllerPassword,
                              label: 'senha',
                              labelStyle: TextStyle(color: context.colors.background),
                              inputDecoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 14, color: context.colors.error),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: !activateIconPassword,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  activateIconPassword = !activateIconPassword;
                                  setState(() {});
                                },
                                child: activateIconPassword
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
                              validator: Validatorless.multiple(
                                [Validatorless.required("Por favor, digite sua senha!")],
                              ),
                              textInputAction: TextInputAction.go,
                              onFieldSubmitted: (_) => validateData(),
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
                        Button.primary(
                          label: 'LOGIN',
                          onPressed: () => validateData(),
                        ),
                        const SizedBox(height: 25),
                        TextButton(
                          onPressed: () {
                            widget.presenter.toRegister();
                          },
                          child: Text(
                            'Não tem conta? Cadastra-se agora',
                            style: context.textStyles.textLight.copyWith(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              color: context.colors.onSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateData() {
    if (form.currentState!.validate()) {
      widget.presenter.signIn(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
    }
  }
}
