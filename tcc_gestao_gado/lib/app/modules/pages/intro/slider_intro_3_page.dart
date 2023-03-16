import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/utils/size_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/widgets/count_widget.dart';

class SliderIntro3Page extends StatefulWidget {
  const SliderIntro3Page({super.key});

  @override
  State<SliderIntro3Page> createState() => _SliderIntro3PageState();
}

class _SliderIntro3PageState extends State<SliderIntro3Page> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: SizedBox(
            width: SizePage.isSmallScreenHeight(context)
                ? MediaQuery.of(context).size.width * .6
                : MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CountWidget(index: 3),
                const SizedBox(height: 25),
                Center(
                  child: CircleAvatarWidget(
                    height: 200,
                    width: 200,
                    image: context.images.introImage3,
                  ),
                ),
                const SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Somos focados em ajudar você a ter total domínio sobre sua gestão de sua propriedade, assim, conseguir acompanhar e planejar toda sua trajetória com seus animais e melhorar seus ',
                        style: context.textStyles.textLight.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                      TextSpan(
                        text: 'investimento ',
                        style: context.textStyles.textMedium.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                      TextSpan(
                        text: ' e ter ',
                        style: context.textStyles.textLight.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                      TextSpan(
                        text: 'melhores decisões,',
                        style: context.textStyles.textMedium.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                      TextSpan(
                        text: ' com seus animais.',
                        style: context.textStyles.textLight.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
