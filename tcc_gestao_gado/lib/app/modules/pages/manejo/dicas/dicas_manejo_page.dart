import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/drawer_menu.dart';

class DicasManejoPage extends StatefulWidget {
  const DicasManejoPage({Key? key}) : super(key: key);

  @override
  State<DicasManejoPage> createState() => _DicasManejoPageState();
}

class _DicasManejoPageState extends State<DicasManejoPage> {
  @override
  Widget build(BuildContext context) {
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
            child: CircleAvatarWidget(width: 50, height: 50, image: context.images.introImage1),
          ),
        ],
      ),
      drawer: const DrawerMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: context.colors.background,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Image.asset(context.images.example),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.circle, color: context.colors.primary),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Uma vaca pode viver cerca de 15 anos e pesar até 700 quilos.',
                            style: context.textStyles.textMedium.copyWith(
                              color: context.colors.primary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.circle, color: context.colors.primary),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'As vacas comem a placenta após o parto.',
                            style: context.textStyles.textMedium.copyWith(
                              color: context.colors.primary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.circle, color: context.colors.primary),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Para fazer 1 kg de queijo, uma vaca tem de comer 3 kg de comida.',
                            style: context.textStyles.textMedium.copyWith(
                              color: context.colors.primary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
