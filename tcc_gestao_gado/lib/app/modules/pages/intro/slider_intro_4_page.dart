import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/widgets/button_widget.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/widgets/count_widget.dart';

class SliderIntro4Page extends StatefulWidget {
  const SliderIntro4Page({super.key});

  @override
  State<SliderIntro4Page> createState() => _SliderIntro4PageState();
}

class _SliderIntro4PageState extends State<SliderIntro4Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const CountWidget(index: 4, padding: EdgeInsets.all(25)),
              CircleAvatarWidget(
                height: 200,
                width: 200,
                image: context.images.introImage4,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 50, 25, 25),
                child: Text(
                  "ESTE É O QUARTO TEXTO DE INTRO",
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
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
        },
      ),
    );
  }
}
