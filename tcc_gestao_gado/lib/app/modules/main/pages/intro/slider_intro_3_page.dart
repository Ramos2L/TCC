import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/utils/size_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/intro/widgets/count_widget.dart';

class SliderIntro3Page extends StatefulWidget {
  static const routeName = '/intro_3';

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
                            'O nosso objetivo é fornecer aos produtores de gado uma ferramenta que ajude a  ',
                        style: context.textStyles.textLight.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                      TextSpan(
                        text: 'aumentar a produtividade ',
                        style: context.textStyles.textMedium.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                      TextSpan(
                        text: 'e ter total acompanhamento como preferir',
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
