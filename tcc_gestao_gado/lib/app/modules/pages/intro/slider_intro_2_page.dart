import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/widgets/button_widget.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/widgets/count_widget.dart';

class SliderIntro2Page extends StatefulWidget {
  const SliderIntro2Page({super.key});

  @override
  State<SliderIntro2Page> createState() => _SliderIntro2PageState();
}

class _SliderIntro2PageState extends State<SliderIntro2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const CountWidget(index: 2, padding: EdgeInsets.all(25)),
              CircleAvatarWidget(
                height: 200,
                width: 200,
                image: context.images.introImage2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 25),
                child: Text(
                  "ESTE É O SEGUNDO TEXTO DE INTRO",
                  style: TextStyle(fontSize: 26, color: context.colors.background),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ButtonWidget(
        padding: const EdgeInsets.all(10),
        backgroundColor: context.colors.background,
        foregroundColor: context.colors.primary,
        icon: const Icon(Icons.arrow_forward),
        onPressed: () => Navigator.pushNamed(context, '/intro_3'),
      ),
    );
  }
}
