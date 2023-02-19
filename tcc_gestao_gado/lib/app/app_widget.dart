import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gestão de Gado",
      home: SplashPage(),
    );
  }
}
