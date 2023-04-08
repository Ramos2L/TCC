import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  cadastrar() async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _senhaController.text,
      );
      userCredential.user!.updateDisplayName(_nomeController.text);
      Navigator.pushNamed(context, '/login');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print(e);
        print('Crie uma senha mais forte');
      } else if (e.code == 'email-already-in-use') {
        print(e);
        print('Email ja utilizado');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 35),
                Text(
                  'Bem vindo!',
                  style: context.textStyles.textMedium.copyWith(
                    color: context.colors.onSecondary,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 15),
                CircleAvatarWidget(
                  width: 125,
                  height: 125,
                  image: context.images.splashImage,
                ),
                const SizedBox(height: 15),
                Text(
                  "CattleControl",
                  style: context.textStyles.textMedium.copyWith(
                    color: context.colors.onSecondary,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Criar conta",
                  style: context.textStyles.textMedium.copyWith(
                    color: context.colors.onSecondary,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                  controller: _nomeController,
                  label: 'nome',
                  labelStyle: TextStyle(color: context.colors.background),
                  inputDecoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 14,
                      color: context.colors.error,
                    ),
                  ),
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(RegExp(r'[\S]')),
                  // ],
                  keyboardType: TextInputType.emailAddress,
                  // validator: Validatorless.multiple(
                  //   [Validatorless.required("Obrigatório"), Validatorless.email("e-mail inválido")],
                  // ),
                  suffixIcon: const Icon(Icons.person),
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(phoneNode);
                  // },
                ),
                CustomTextField(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                  controller: _emailController,
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
                  suffixIcon: const Icon(Icons.mail),
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(phoneNode);
                  // },
                ),
                CustomTextField(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                  controller: _senhaController,
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
                CustomTextField(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  controller: _senhaController,
                  label: 'confirme sua senha',
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
                    label: 'CADASTRAR',
                    onPressed: () {
                      cadastrar();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
