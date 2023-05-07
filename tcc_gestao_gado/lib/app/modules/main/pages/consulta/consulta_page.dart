import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/button.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/custom_text_field.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/list_tile_widget.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/presenter/consulta_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/view/consulta_view_impl.dart';

class ConsultaPage extends StatefulWidget {
  static const routeName = '/consulta';
  final ConsultaPresenter presenter;
  const ConsultaPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<ConsultaPage> createState() => _ConsultaPageState();
}

class _ConsultaPageState extends ConsultaViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBarWidget.appBar(context, title: '${widget.presenter.getName()}'),
      drawer: DrawerMenu(nameUser: '${widget.presenter.getName()}'),
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
                        Text(
                          'Consultar animais',
                          style: context.textStyles.textMedium.copyWith(
                            fontSize: 20,
                            color: context.colors.onPrimary,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'Para consultar apenas digite o código do animal para ser buscado todas informações.',
                          style: context.textStyles.textMedium.copyWith(
                            color: context.colors.onPrimary,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 25),
                        CustomTextField(
                          controller: codAnimalController,
                          hintText: 'Código do animal',
                          labelStyle: TextStyle(color: context.colors.background),
                          inputDecoration: InputDecoration(
                            errorStyle: TextStyle(
                              fontSize: 14,
                              color: context.colors.error,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          suffixIcon: const Icon(Icons.search),
                          onFieldSubmitted: (_) => consult(),
                        ),
                        const SizedBox(height: 20),
                        cattleAnimal.isNotEmpty
                            ? Column(
                                children: [
                                  ListTileWidget(
                                    title: 'Código do animal:',
                                    subtitle: '${cattleAnimal[0].id}',
                                  ),
                                  ListTileWidget(
                                    title: 'Data de cadastro:',
                                    subtitle: '${cattleAnimal[0].type}',
                                  ),
                                  ListTileWidget(
                                    title: 'Data de cadastro:',
                                    subtitle: '${cattleAnimal[0].date}',
                                  ),
                                  ListTileWidget(
                                    title: 'Sexo do animal:',
                                    subtitle: '${cattleAnimal[0].sex}',
                                  ),
                                  ListTileWidget(
                                    title: 'Amamentando:',
                                    subtitle: cattleAnimal[0].breastfeeding == true ? "Sim" : "Não",
                                  ),
                                  ListTileWidget(
                                    title: 'Meio aquisição do animal:',
                                    subtitle: '${cattleAnimal[0].quite}',
                                  ),
                                  cattleAnimal[0].numberMother != ""
                                      ? ListTileWidget(
                                          title: 'Nº do mãe:',
                                          subtitle: '${cattleAnimal[0].numberMother}',
                                        )
                                      : const SizedBox(),
                                  cattleAnimal[0].numberFather != ""
                                      ? ListTileWidget(
                                          title: 'Nº do pai:',
                                          subtitle: '${cattleAnimal[0].numberFather}',
                                        )
                                      : const SizedBox(),
                                  ListTileWidget(
                                    title: 'Peso do animal:',
                                    subtitle: '${cattleAnimal[0].weightCattle}',
                                  ),
                                  ListTileWidget(
                                    title: 'Raça do animal:',
                                    subtitle: '${cattleAnimal[0].race}',
                                  ),
                                  cattleAnimal[0].observations != ""
                                      ? ListTileWidget(
                                          title: 'Observações:',
                                          subtitle: '${cattleAnimal[0].observations}',
                                        )
                                      : const SizedBox(),
                                ],
                              )
                            : const SizedBox(),
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
                    child: Button.primary(label: 'BUSCAR', onPressed: () async => consult()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void consult() async {
    await widget.presenter.getCattle(idCattle: codAnimalController.text);
    setState(() {});
  }
}
