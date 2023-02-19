import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';

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
                tween: Tween(begin: 50.0, end: 200.0), // set tween
                duration: const Duration(seconds: 3), // set duration
                onCompleted: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => const SliderIntroPage(),
                  //   ),
                  // );
                },
                builder: (context, value, _) {
                  return Container(
                    width: value,
                    height: value,
                    color: context.colors.primary,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(context.images.splashImage),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Gestão para seu Gado",
                  style: TextStyle(color: context.colors.onPrimary),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
