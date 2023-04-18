import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/utils/size_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/intro/widgets/count_widget.dart';

class SliderIntro2Page extends StatefulWidget {
  static const routeName = '/intro_2';

  const SliderIntro2Page({super.key});

  @override
  State<SliderIntro2Page> createState() => _SliderIntro2PageState();
}

class _SliderIntro2PageState extends State<SliderIntro2Page> {
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
                const CountWidget(index: 2),
                const SizedBox(height: 25),
                Center(
                  child: CircleAvatarWidget(
                    height: 200,
                    width: 200,
                    image: context.images.introImage2,
                  ),
                ),
                const SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Com uma interface ',
                        style: context.textStyles.textLight.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                      TextSpan(
                        text: 'intuitiva e recursos ',
                        style: context.textStyles.textMedium.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'para auxiliá-lo a acompanhar seu gado, vai ser ainda mais fácil gerenciar sua propriedade',
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