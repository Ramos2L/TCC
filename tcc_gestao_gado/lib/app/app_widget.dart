import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/theme/app_theme.dart';
import 'package:tcc_gestao_gado/app/modules/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gestão de Gado",
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
