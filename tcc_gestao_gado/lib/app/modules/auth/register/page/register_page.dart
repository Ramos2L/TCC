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
  bool activeIconPassword = false;
  bool activeIconPasswordRepeat = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  cadastrar() async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      userCredential.user!.updateDisplayName(_nameController.text);
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 35),
                  Text(
                    'Bem vindo!',
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      color: context.colors.onSecondary,
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
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      color: context.colors.onSecondary,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Criar conta",
                    style: context.textStyles.textMedium.copyWith(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      color: context.colors.onSecondary,
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                    controller: _nameController,
                    label: 'nome',
                    labelStyle: TextStyle(color: context.colors.background),
                    keyboardType: TextInputType.name,
                    inputDecoration: InputDecoration(
                      errorStyle: TextStyle(color: context.colors.error, fontSize: 14),
                    ),
                    validator: Validatorless.multiple(
                      [Validatorless.required("Campo obrigatório")],
                    ),
                    suffixIcon: const Icon(Icons.person),
                    textInputAction: TextInputAction.next,
                    // onFieldSubmitted: (_) {
                    //   FocusScope.of(context).requestFocus(phoneNode);
                    // },
                  ),
                  CustomTextField(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                    controller: _phoneController,
                    label: 'telefone',
                    labelStyle: TextStyle(color: context.colors.background),
                    keyboardType: TextInputType.phone,
                    inputDecoration: InputDecoration(
                      errorStyle: TextStyle(color: context.colors.error, fontSize: 14),
                    ),
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required("Campo obrigatório"),
                        Validatorless.min(11, "Digite um número válido")
                      ],
                    ),
                    suffixIcon: const Icon(Icons.phone),
                    textInputAction: TextInputAction.next,
                    // onFieldSubmitted: (_) {
                    //   FocusScope.of(context).requestFocus(phoneNode);
                    // },
                  ),
                  CustomTextField(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                    controller: _emailController,
                    label: 'e-mail',
                    labelStyle: TextStyle(color: context.colors.background),
                    keyboardType: TextInputType.emailAddress,
                    inputDecoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 14, color: context.colors.error),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[\S]')),
                    ],
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required("Obrigatório"),
                        Validatorless.email("e-mail inválido")
                      ],
                    ),
                    suffixIcon: const Icon(Icons.mail),
                    textInputAction: TextInputAction.next,
                    // onFieldSubmitted: (_) {
                    //   FocusScope.of(context).requestFocus(phoneNode);
                    // },
                  ),
                  CustomTextField(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                    controller: _passwordController,
                    label: 'senha',
                    labelStyle: TextStyle(color: context.colors.background),
                    inputDecoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 14, color: context.colors.error),
                    ),
                    obscureText: !activeIconPassword,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeIconPassword = !activeIconPassword;
                        });
                      },
                      child: activeIconPassword
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    validator: Validatorless.multiple(
                      [Validatorless.required("Obrigatório")],
                    ),
                    textInputAction: TextInputAction.next,
                    // onFieldSubmitted: (_) {
                    //   FocusScope.of(context).requestFocus(phoneNode);
                    // },
                  ),
                  CustomTextField(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    controller: _passwordRepeatController,
                    label: 'confirme sua senha',
                    labelStyle: TextStyle(color: context.colors.background),
                    inputDecoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 14, color: context.colors.error),
                    ),
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required("Obrigatório"),
                        Validatorless.compare(_passwordController, 'Senhas diferentes!')
                      ],
                    ),
                    obscureText: !activeIconPasswordRepeat,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeIconPasswordRepeat = !activeIconPasswordRepeat;
                        });
                      },
                      child: activeIconPasswordRepeat
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    textInputAction: TextInputAction.go,
                    // onFieldSubmitted: (_) {
                    //   FocusScope.of(context).requestFocus(phoneNode);
                    // },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                    child: Button.primary(
                        label: 'CADASTRAR',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cadastrar();
                          } else {
                            //MENSAGEM DE ERRO
                            print('MENSAGEM DE ERRO');
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
