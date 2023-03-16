import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/utils/size_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/widgets/count_widget.dart';

class SliderIntro1Page extends StatefulWidget {
  const SliderIntro1Page({super.key});

  @override
  State<SliderIntro1Page> createState() => _SliderIntro1PageState();
}

class _SliderIntro1PageState extends State<SliderIntro1Page> {
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
                const CountWidget(index: 1),
                const SizedBox(height: 25),
                Center(
                  child: CircleAvatarWidget(
                    height: 200,
                    width: 200,
                    image: context.images.introImage1,
                  ),
                ),
                const SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Seja bem vindo ao aplicativo para ',
                        style: context.textStyles.textLight.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                      TextSpan(
                        text: 'gestão de gado.',
                        style: context.textStyles.textMedium.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'O aplicativo criado para que todo produtor rural tenha a ',
                        style: context.textStyles.textLight.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                      TextSpan(
                        text: 'governança e a gestão nas mãos.',
                        style: context.textStyles.textMedium.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Siga os passos para começar utilizar o aplicativo',
                  style: context.textStyles.textLight.copyWith(
                    color: context.colors.onSecondary,
                    fontSize: 27,
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
