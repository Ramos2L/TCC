import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';

class DesmamaPage extends StatefulWidget {
  static const routeName = '/desmama';
  const DesmamaPage({Key? key}) : super(key: key);

  @override
  State<DesmamaPage> createState() => _DesmamaPageState();
}

class _DesmamaPageState extends State<DesmamaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBarWidget.appBar(context),
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
                        const SizedBox(height: 25),
                        Text(
                          'Desmama do animal',
                          style: context.textStyles.textMedium.copyWith(
                            color: context.colors.onPrimary,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 25),
                        CustomTextField(
                          //controller: ,
                          hintText: 'Data da desmama',
                          labelStyle: TextStyle(color: context.colors.background),
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
                          hintText: 'Código do animal',
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
                  //const Spacer(),
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

    //     SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
    //         child: Column(
    //           children: [
    //             const SizedBox(height: 25),
    //             Text(
    //               'Desmama do animal',
    //               style: context.textStyles.textMedium.copyWith(
    //                 color: context.colors.onPrimary,
    //                 fontSize: 20,
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ),
    //             const SizedBox(height: 25),
    //             CustomTextField(
    //               //controller: ,
    //               hintText: 'Data da desmama',
    //               labelStyle: TextStyle(color: context.colors.background),
    //               inputDecoration: InputDecoration(
    //                 errorStyle: TextStyle(
    //                   fontSize: 14,
    //                   color: context.colors.error,
    //                 ),
    //               ),
    //               keyboardType: TextInputType.text,
    //               obscureText: false,
    //               suffixIcon: const Icon(Icons.search),
    //               // onFieldSubmitted: (_) {
    //               //   FocusScope.of(context).requestFocus(phoneNode);
    //               // },
    //             ),
    //             const SizedBox(height: 25),
    //             CustomTextField(
    //               //controller: ,
    //               hintText: 'Código do animal',
    //               labelStyle: TextStyle(color: context.colors.background),
    //               inputDecoration: InputDecoration(
    //                 errorStyle: TextStyle(
    //                   fontSize: 14,
    //                   color: context.colors.error,
    //                 ),
    //               ),
    //               keyboardType: TextInputType.text,
    //               obscureText: false,
    //               suffixIcon: const Icon(Icons.calendar_month),
    //               // onFieldSubmitted: (_) {
    //               //   FocusScope.of(context).requestFocus(phoneNode);
    //               // },
    //             ),
    //             const SizedBox(height: 25),
    //             CustomTextField(
    //               //controller: ,
    //               hintText: 'Observações (optativo)',
    //               labelStyle: TextStyle(color: context.colors.background),
    //               inputDecoration: InputDecoration(
    //                 errorStyle: TextStyle(
    //                   fontSize: 14,
    //                   color: context.colors.error,
    //                 ),
    //               ),
    //               keyboardType: TextInputType.text,
    //               obscureText: false,
    //               suffixIcon: const Icon(Icons.search),
    //               // onFieldSubmitted: (_) {
    //               //   FocusScope.of(context).requestFocus(phoneNode);
    //               // },
    //             ),
    //             const SizedBox(height: 25),
    //             Button.primary(
    //               label: 'SALVAR',
    //               onPressed: () {
    //                 //Navigator.pushNamed(context, '/home');
    //               },
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}