import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
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
                  "NOME DO APP",
                  style: TextStyle(color: context.colors.background, fontSize: 18),
                ),
                const SizedBox(height: 50),
                CustomTextField(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                  //controller: ,
                  label: 'e-mail',
                  labelStyle: TextStyle(color: context.colors.background),
                  inputDecoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 14,
                      color: context.colors.error,
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[\S]')),
                  ],
                  keyboardType: TextInputType.emailAddress,
                  validator: Validatorless.multiple(
                    [Validatorless.required("Obrigatório"), Validatorless.email("e-mail inválido")],
                  ),
                  suffixIcon: const Icon(Icons.person),
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(phoneNode);
                  // },
                ),
                CustomTextField(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                  //controller: ,
                  label: 'senha',
                  labelStyle: TextStyle(color: context.colors.background),
                  inputDecoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 14,
                      color: context.colors.error,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(phoneNode);
                  // },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Button.primary(
                    label: 'LOGIN',
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    'Não tem conta? Cadastra-se agora',
                    style: context.textStyles.textLight.copyWith(
                      color: context.colors.onSecondary,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
