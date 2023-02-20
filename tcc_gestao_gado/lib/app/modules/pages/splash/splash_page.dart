import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.colors.primary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlayAnimationBuilder<double>(
                tween: Tween(begin: 50.0, end: 200.0),
                duration: const Duration(seconds: 3),
                onCompleted: () => Navigator.pushNamed(context, '/intro_1'),
                builder: (context, value, _) {
                  return CircleAvatarWidget(
                    width: value,
                    height: value,
                    image: context.images.splashImage,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Gestão para seu Gado",
                  style: TextStyle(color: context.colors.onPrimary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
