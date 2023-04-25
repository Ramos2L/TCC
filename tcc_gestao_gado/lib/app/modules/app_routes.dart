import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/login_page.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/login_route.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/register_page.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/register_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/cadastro_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/cadastro_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/cadastro_animal_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/checagem/check_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/checagem/check_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/consulta/consulta_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/consulta/consulta_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/conta/conta_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/conta/conta_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/home/home_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/home/home_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/informacoes_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/informacoes_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/intro/intro_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/intro/slider_intro_1_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/intro/slider_intro_2_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/intro/slider_intro_3_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/intro/slider_intro_4_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/manejo_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/manejo_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/descarte/descarte_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/desmama/desmama_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/desmama/desmama_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/dicas/dicas_manejo_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/pesagem/pesagem_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pasto/pasto_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pasto/pasto_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/preco_arroba/preco_arroba_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/relatorio/relatorio_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/sobre/sobre_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/vendas/vendas_animal_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/vendas/vendas_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/vendas/vendas_route.dart';
import 'package:tcc_gestao_gado/app/modules/splash/splash_page.dart';

import 'main/manejo/pages/dicas/dicas_manejo_page.dart';
import 'main/preco_arroba/preco_arroba_route.dart';
import 'main/relatorio/relatorio_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashPage.routeName: (context) => const SplashPage(),
    CheckPage.routeName: (context) => const CheckRoute(),
    IntroPage.routeName: (context) => const IntroPage(),
    SliderIntro1Page.routeName: (context) => const SliderIntro1Page(),
    SliderIntro2Page.routeName: (context) => const SliderIntro2Page(),
    SliderIntro3Page.routeName: (context) => const SliderIntro3Page(),
    SliderIntro4Page.routeName: (context) => const SliderIntro4Page(),
    LoginPage.routeName: (context) => const LoginRoute(),
    RegisterPage.routeName: (context) => const RegisterRoute(),
    HomePage.routeName: (context) => const HomeRoute(),
    ManejoPage.routeName: (context) => const ManejoRoute(),
    PesagemPage.routeName: (context) => const PesagemPage(),
    DesmamaPage.routeName: (context) => const DesmamaRoute(),
    DescartePage.routeName: (context) => const DescartePage(),
    DicasManejoPage.routeName: (context) => const DicasManejoRoute(),
    CadastroPage.routeName: (context) => const CadastroRoute(),
    CadastroAnimalPage.routeName: (context) => const CadastroAnimalPage(),
    RelatorioPage.routeName: (context) => const RelatorioRoute(),
    VendasPage.routeName: (context) => const VendasRoute(),
    VendasAnimalPage.routeName: (context) => const VendasAnimalPage(),
    PastoPage.routeName: (context) => const PastoRoute(),
    ConsultaPage.routeName: (context) => const ConsultaRoute(),
    InformacoesPage.routeName: (context) => const InformacoesRoute(),
    PrecoArrobaPage.routeName: (context) => const PrecoArrobaRoute(),
    SobrePage.routeName: (context) => const SobrePage(),
    ContaPage.routeName: (context) => const ContaRoute(),
  };
}
