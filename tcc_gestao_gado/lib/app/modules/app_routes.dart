import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/pages/cadastro/cadastro_animal_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/cadastro/cadastro_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/checagem/check_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/consulta/consulta_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/home/home_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/informacoes/informacoes_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/intro_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/slider_intro_1_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/slider_intro_2_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/slider_intro_3_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/slider_intro_4_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/login/login_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/manejo/descarte/descarte_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/manejo/desmama/desmama_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/manejo/manejo_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/manejo/pesagem/pesagem_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/nascimento/nascimento_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/pasto/pasto_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/register/register_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/splash/splash_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/vendas/vendas_animal_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/vendas/vendas_page.dart';

import 'pages/manejo/dicas/dicas_manejo_page.dart';
import 'pages/relatorio/relatorio_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashPage.routeName: (context) => const SplashPage(),
    CheckPage.routeName: (context) => const CheckPage(),
    IntroPage.routeName: (context) => const IntroPage(),
    SliderIntro1Page.routeName: (context) => const SliderIntro1Page(),
    SliderIntro2Page.routeName: (context) => const SliderIntro2Page(),
    SliderIntro3Page.routeName: (context) => const SliderIntro3Page(),
    SliderIntro4Page.routeName: (context) => const SliderIntro4Page(),
    LoginPage.routeName: (context) => const LoginPage(),
    RegisterPage.routeName: (context) => const RegisterPage(),
    HomePage.routeName: (context) => const HomePage(),
    ManejoPage.routeName: (context) => const ManejoPage(),
    PesagemPage.routeName: (context) => const PesagemPage(),
    DesmamaPage.routeName: (context) => const DesmamaPage(),
    DescartePage.routeName: (context) => const DescartePage(),
    DicasManejoPage.routeName: (context) => const DicasManejoPage(),
    CadastroPage.routeName: (context) => const CadastroPage(),
    CadastroAnimalPage.routeName: (context) => const CadastroAnimalPage(),
    RelatorioPage.routeName: (context) => const RelatorioPage(),
    VendasPage.routeName: (context) => const VendasPage(),
    VendasAnimalPage.routeName: (context) => const VendasAnimalPage(),
    PastoPage.routeName: (context) => const PastoPage(),
    ConsultaPage.routeName: (context) => const ConsultaPage(),
    InformacoesPage.routeName: (context) => const InformacoesPage(),
    NascimentoPage.routeName: (context) => const NascimentoPage(),
  };
}
