import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/widgets/count_widget.dart';

class SliderIntro2Page extends StatefulWidget {
  const SliderIntro2Page({super.key});

  @override
  State<SliderIntro2Page> createState() => _SliderIntro2PageState();
}

class _SliderIntro2PageState extends State<SliderIntro2Page> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const CountWidget(index: 2, padding: EdgeInsets.all(25)),
            CircleAvatarWidget(height: 200, width: 200, image: context.images.introImage2),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'A ferramenta que você precisa para ',
                      style: context.textStyles.textLight.copyWith(
                        color: context.colors.onSecondary,
                        fontSize: 27,
                      ),
                    ),
                    TextSpan(
                      text: 'controlar seu gado com eficiência. ',
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
