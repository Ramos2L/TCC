import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/login_page.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/login_route.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/recuperate_page.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/recuperate_route.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/register_page.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/register_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/cadastro_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/cadastro_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/cadastro_animal_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/cadastro_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/checagem/check_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/checagem/check_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/consulta_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/consulta_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/conta/conta_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/conta/conta_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/home/home_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/home/home_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/informacoes/informacoes_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/informacoes/informacoes_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/intro/intro_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/intro/slider_intro_1_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/intro/slider_intro_2_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/intro/slider_intro_3_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/intro/slider_intro_4_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/manejo_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/manejo_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/castrar/castrar_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/castrar/castrar_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/descarte/descarte_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/descarte/descarte_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/desmama/desmama_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/desmama/desmama_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/dicas_manejo_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/dicas_manejo_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/pesagem/pesagem_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/pesagem/pesagem_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/pasto/pages/adubacao_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/pasto/pages/calagem_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/pasto/pages/n_piquetes_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/pasto/pasto_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/pasto/pasto_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/preco_arroba/preco_arroba_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/preco_arroba/preco_arroba_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/relatorio_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/relatorio_route.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/sobre/sobre_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/vendas/vendas_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/vendas/vendas_route.dart';
import 'package:tcc_gestao_gado/app/modules/splash/splash_page.dart';

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
    RecuperatePage.routeName: (context) => const RecuperateRoute(),
    RegisterPage.routeName: (context) => const RegisterRoute(),
    HomePage.routeName: (context) => const HomeRoute(),
    ManejoPage.routeName: (context) => const ManejoRoute(),
    PesagemPage.routeName: (context) => const PesagemRoute(),
    DesmamaPage.routeName: (context) => const DesmamaRoute(),
    DescartePage.routeName: (context) => const DescarteRoute(),
    CastrarPage.routeName: (context) => const CastrarRoute(),
    DicasManejoPage.routeName: (context) => const DicasManejoRoute(),
    CadastroPage.routeName: (context) => const CadastroRoute(),
    CadastroAnimalPage.routeName: (context) => const CadastroAnimalRoute(),
    RelatorioPage.routeName: (context) => const RelatorioRoute(),
    VendasPage.routeName: (context) => const VendasRoute(),
    PastoPage.routeName: (context) => const PastoRoute(),
    NPiquetesPage.routeName: (context) => const NPiquetesPage(),
    CalagemPage.routeName: (context) => const CalagemPage(),
    ConsultaPage.routeName: (context) => const ConsultaRoute(),
    AdubacaoPage.routeName: (context) => const AdubacaoPage(),
    InformacoesPage.routeName: (context) => const InformacoesRoute(),
    PrecoArrobaPage.routeName: (context) => const PrecoArrobaRoute(),
    SobrePage.routeName: (context) => const SobrePage(),
    ContaPage.routeName: (context) => const ContaRoute(),
  };
}
