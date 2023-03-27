import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/slider_intro_1_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/slider_intro_2_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/slider_intro_3_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/slider_intro_4_page.dart';
import 'package:tcc_gestao_gado/app/modules/pages/intro/widgets/button_widget.dart';

class IntroPage extends StatefulWidget {
  static const routeName = '/intro_page';

  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int page = 0;

  setPage(int pageAtually) {
    page = pageAtually;
  }

  PageController controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: PageView(
                controller: controller,
                onPageChanged: setPage,
                children: const <Widget>[
                  SliderIntro1Page(),
                  SliderIntro2Page(),
                  SliderIntro3Page(),
                  SliderIntro4Page(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ButtonWidget(
        padding: const EdgeInsets.all(10),
        backgroundColor: context.colors.background,
        foregroundColor: context.colors.primary,
        icon: const Icon(Icons.arrow_forward),
        onPressed: () {
          if ((controller.page)!.toInt() != 3) {
            controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          }
        },
      ),
    );
  }
}
