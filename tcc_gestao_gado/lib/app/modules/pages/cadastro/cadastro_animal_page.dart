import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/pages/cadastro/cadastro_page.dart';

class CadastroAnimalPage extends StatefulWidget {
  static const routeName = '/cadastro_animal';

  const CadastroAnimalPage({Key? key}) : super(key: key);

  @override
  State<CadastroAnimalPage> createState() => _CadastroAnimalPageState();
}

class _CadastroAnimalPageState extends State<CadastroAnimalPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;

    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.colors.onPrimary, size: 50),
        title: SizedBox(
          height: 50,
          child: Center(
            child: Text(
              'Olá, Lucas',
              style: context.textStyles.textMedium.copyWith(
                color: context.colors.onPrimary,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: CircleAvatarWidget(
                width: 50, height: 50, image: context.images.introImage1),
          ),
        ],
      ),
      drawer: const DrawerMenu(),
      body: SafeArea(
        child: CustomScrollView(
          scrollBehavior:
              ScrollConfiguration.of(context).copyWith(scrollbars: false),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    child: Column(
                      children: [
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
                        CustomTextField(
                          //controller: ,
                          hintText: 'Nº ${args.animal}',
                          labelStyle:
                              TextStyle(color: context.colors.background),
                          inputDecoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 14,
                              color: context.colors.error,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          suffixIcon:
                              const Icon(Icons.app_registration_rounded),
                          // onFieldSubmitted: (_) {
                          //   FocusScope.of(context).requestFocus(phoneNode);
                          // },
                        ),
                        const SizedBox(height: 25),
                        CustomTextField(
                          //controller: ,
                          hintText: 'Data de nascimento',
                          labelStyle:
                              TextStyle(color: context.colors.background),
                          inputDecoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 14,
                              color: context.colors.error,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          suffixIcon: const Icon(Icons.calendar_month),
                          // onFieldSubmitted: (_) {
                          //   FocusScope.of(context).requestFocus(phoneNode);
                          // },
                        ),
                        const SizedBox(height: 25),
                        CustomTextField(
                          //controller: ,
                          hintText: 'Peso do animal (kg)',
                          labelStyle:
                              TextStyle(color: context.colors.background),
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
                          labelStyle:
                              TextStyle(color: context.colors.background),
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
                          hintText: 'Observações (optativo)',
                          labelStyle:
                              TextStyle(color: context.colors.background),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
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
