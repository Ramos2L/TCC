import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/widgets/count_widget.dart';

class SliderIntro4Page extends StatefulWidget {
  const SliderIntro4Page({super.key});

  @override
  State<SliderIntro4Page> createState() => _SliderIntro4PageState();
}

class _SliderIntro4PageState extends State<SliderIntro4Page> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const CountWidget(index: 4, padding: EdgeInsets.all(25)),
            CircleAvatarWidget(height: 200, width: 200, image: context.images.introImage4),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Lembre-se de sempre salvar seus dados enquanto está off line e de sempre acompanhar seus relatórios. O aplicativo é e sempre será ',
                      style: context.textStyles.textLight.copyWith(
                        color: context.colors.onSecondary,
                        fontSize: 27,
                      ),
                    ),
                    TextSpan(
                      text: '100% grátis.',
                      style: context.textStyles.textMedium.copyWith(
                        color: context.colors.onSecondary,
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Agora você está pronto para prosseguir e der inicio nessa ferramenta para te auxiliar a produzir com mais segurança. ',
                      style: context.textStyles.textLight.copyWith(
                        color: context.colors.onSecondary,
                        fontSize: 27,
                      ),
                    ),
                    TextSpan(
                      text: ':) ',
                      style: context.textStyles.textMedium.copyWith(
                        color: context.colors.onSecondary,
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
