import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/dicas/presenter/dicas_manejo_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/dicas/view/dicas_manejo_view_impl.dart';

class DicasManejoPage extends StatefulWidget {
  static const routeName = '/dicas-manejo';
  final DicasManejoPresenter presenter;
  const DicasManejoPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<DicasManejoPage> createState() => _DicasManejoPageState();
}

class _DicasManejoPageState extends DicasManejoViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      drawer: const DrawerMenu(),
      body: SafeArea(
        child: isActive
            ? Padding(
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
                          const SizedBox(width: 15),
                          Text(
                            'Voltar',
                            style: context.textStyles.textMedium.copyWith(
                              color: context.colors.onPrimary,
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: context.colors.background,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  listDataManagementTips[0],
                                  loadingBuilder: (
                                    BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress,
                                  ) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                listDataManagementTips[1],
                                overflow: TextOverflow.clip,
                                style: context.textStyles.textMedium.copyWith(
                                  color: context.colors.primary,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                listDataManagementTips[2],
                                overflow: TextOverflow.clip,
                                style: context.textStyles.textMedium.copyWith(
                                  color: context.colors.primary,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                listDataManagementTips[3],
                                overflow: TextOverflow.clip,
                                style: context.textStyles.textMedium.copyWith(
                                  color: context.colors.primary,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Container(
                  color: context.colors.primary,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
      ),
    );
  }
}
