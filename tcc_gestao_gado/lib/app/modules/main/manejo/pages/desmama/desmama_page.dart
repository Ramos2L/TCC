import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/desmama/presenter/desmama_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/desmama/view/desmama_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class DesmamaPage extends StatefulWidget {
  static const routeName = '/desmama';
  final DesmamaPresenter presenter;
  const DesmamaPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<DesmamaPage> createState() => _DesmamaPageState();
}

class _DesmamaPageState extends DesmamaViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
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
                          'Desmama do animal',
                          style: context.textStyles.textMedium.copyWith(
                            color: context.colors.onPrimary,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 25),
                        GestureDetector(
                          onTap: showDatePickerFunc,
                          child: CustomTextField(
                            controller: dateController,
                            enabled: false,
                            label: 'Data da pesagem',
                            hintText: dateTime.toString().substring(0, 11),
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
                            validator: Validatorless.multiple(
                              [
                                Validatorless.required("Campo obrigatório"),
                              ],
                            ),
                            // onFieldSubmitted: (_) {
                            //   FocusScope.of(context).requestFocus(phoneNode);
                            // },
                          ),
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
  }
}
