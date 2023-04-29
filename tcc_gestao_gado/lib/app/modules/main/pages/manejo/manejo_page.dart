import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/app_bar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_principal.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/container_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/presenter/manejo_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/view/manejo_view_impl.dart';

class ManejoPage extends StatefulWidget {
  static const routeName = '/manejo';
  final ManejoPresenter presenter;
  const ManejoPage({super.key, required this.presenter});

  @override
  State<ManejoPage> createState() => _ManejoPageState();
}

class _ManejoPageState extends ManejoViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBarWidget.appBar(context, title: '${widget.presenter.getName()}'),
      drawer: DrawerMenu(nameUser: '${widget.presenter.getName()}'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              children: [
                const ContainerPrincipal(),
                const SizedBox(height: 25),
                Text(
                  'Manejo dos animais',
                  style: context.textStyles.textMedium.copyWith(
                    color: context.colors.onPrimary,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Pesagem',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/pesagem');
                  },
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Desmama',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/desmama');
                  },
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Descarte',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/descarte');
                  },
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: ContainerWidget(
                    title: 'Dicas de manejo',
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.primary,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/dicas-manejo');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
