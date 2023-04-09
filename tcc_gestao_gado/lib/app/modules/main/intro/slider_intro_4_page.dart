import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/core/utils/size_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/intro/widgets/count_widget.dart';

class SliderIntro4Page extends StatefulWidget {
  static const routeName = '/intro_4';

  const SliderIntro4Page({super.key});

  @override
  State<SliderIntro4Page> createState() => _SliderIntro4PageState();
}

class _SliderIntro4PageState extends State<SliderIntro4Page> {
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
                const CountWidget(index: 4),
                const SizedBox(height: 25),
                Center(
                  child: CircleAvatarWidget(
                    height: 200,
                    width: 200,
                    image: context.images.introImage4,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'Explore o nosso aplicativo e comece a gerenciar a sua fazenda de gado com mais eficiência agora mesmo!',
                  style: context.textStyles.textLight.copyWith(
                    color: context.colors.onSecondary,
                    fontSize: 27,
                  ),
                ),
                const SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Lembre-se de sempre salvar seus dados enquanto estiver off-line. O aplicativo é e sempre será ',
                        style: context.textStyles.textLight.copyWith(
                          color: context.colors.onSecondary,
                          fontSize: 27,
                        ),
                      ),
                      TextSpan(
                        text: '100% gratuito.\n:)',
                        style: context.textStyles.textMedium.copyWith(
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
