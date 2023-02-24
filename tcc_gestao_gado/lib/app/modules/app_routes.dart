import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/pages/home/home_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/slider_intro_1_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/slider_intro_2_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/slider_intro_3_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/slider_intro_4_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/login/login_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/register/register_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/splash/splash_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashPage(),
    '/intro_1': (context) => const SliderIntro1Page(),
    '/intro_2': (context) => const SliderIntro2Page(),
    '/intro_3': (context) => const SliderIntro3Page(),
    '/intro_4': (context) => const SliderIntro4Page(),
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
    '/home': (context) => const HomePage(),
  };
}
