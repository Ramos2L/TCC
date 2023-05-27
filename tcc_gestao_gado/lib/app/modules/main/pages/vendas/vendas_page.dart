import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_principal.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/vendas/presenter/vendas_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/vendas/view/vendas_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class Arguments {
  final String animal;

  Arguments(this.animal);
}

class VendasPage extends StatefulWidget {
  static const routeName = '/vendas';
  final VendasPresenter presenter;
  const VendasPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<VendasPage> createState() => _VendasPageState();
}

class _VendasPageState extends VendasViewImpl {
  bool refresh = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBarWidget.appBar(context, title: '${widget.presenter.getName()}'),
      drawer: DrawerMenu(nameUser: '${widget.presenter.getName()}'),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
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
                            ContainerPrincipal(refresh: refresh),
                            const SizedBox(height: 25),
                            Text(
                              'Vendas',
                              style: context.textStyles.textMedium.copyWith(
                                fontSize: 20,
                                color: context.colors.onPrimary,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 25),
                            GestureDetector(
                              onTap: showDatePickerFunc,
                              child: CustomTextField(
                                controller: dateController,
                                enabled: false,
                                label: 'Data da venda',
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
                              hintText: 'Nº do animal',
                              labelStyle: TextStyle(color: context.colors.background),
                              inputDecoration: InputDecoration(
                                errorStyle: TextStyle(
                                  fontSize: 14,
                                  color: context.colors.error,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              suffixIcon: const Icon(
                                Icons.app_registration_rounded,
                              ),
                              validator: Validatorless.multiple(
                                [Validatorless.required("Campo obrigatório")],
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 25),
                            CustomTextField(
                              controller: weigthController,
                              hintText: 'Peso do animal (kg)',
                              labelStyle: TextStyle(color: context.colors.background),
                              inputDecoration: InputDecoration(
                                errorStyle: TextStyle(
                                  fontSize: 14,
                                  color: context.colors.error,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              suffixIcon: const Icon(Icons.balance),
                              validator: Validatorless.multiple(
                                [Validatorless.required("Campo obrigatório")],
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 25),
                            CustomTextField(
                              controller: priceController,
                              hintText: 'Preço',
                              labelStyle: TextStyle(color: context.colors.background),
                              inputDecoration: InputDecoration(
                                errorStyle: TextStyle(
                                  fontSize: 14,
                                  color: context.colors.error,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              suffixIcon: const Icon(Icons.money),
                              validator: Validatorless.multiple(
                                [Validatorless.required("Campo obrigatório")],
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 25),
                            CustomTextField(
                              controller: observationsController,
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
                              onFieldSubmitted: (_) => registerVenda(),
                              textInputAction: TextInputAction.next,
                            ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                        child: Button.primary(
                          label: 'VENDER',
                          onPressed: () => registerVenda(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    setState(() => refresh = !refresh);
    return Future.delayed(const Duration(seconds: 1));
  }

  void registerVenda() {
    if (formKey.currentState!.validate()) {
      widget.presenter.registerVenda(
        numberAnimal: numberAnimalController.text,
        weigth: weigthController.text,
        price: priceController.text,
        date: DateFormat("dd/MM/yyyy").format(dateTime),
        observations: observationsController.text,
      );
    } else {
      showCustomSnackBar("Opss! Algo deu errado");
    }
  }
}
