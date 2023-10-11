import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri url = Uri.parse(
  'https://www.embrapa.br/agencia-de-informacao-tecnologica/cultivos/feijao/producao/calagem#:~:text=Portanto%2C%20a%20calagem%20%C3%A9%20a,ra%C3%ADzes%20e%20incrementos%20de%20produtividade.',
);

class CalagemPage extends StatelessWidget {
  static const routeName = '/calagem';
  const CalagemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        Icon(
                          color: context.colors.onPrimary,
                          Icons.arrow_back_rounded,
                          size: 35,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'Voltar',
                          style: context.textStyles.textMedium.copyWith(
                            fontSize: 20,
                            color: context.colors.onPrimary,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Image.asset(context.images.calagem),
                  const SizedBox(height: 15),
                  Text(
                    '     Calagem é a etapa do preparo do solo para cultivo agrícola na qual se aplica calcário com os objetivos de elevar os teores de cálcio e magnésio, neutralização do alumínio trivalente e corrigir o pH do solo, para um desenvolvimento satisfatório das culturas.',
                    textAlign: TextAlign.justify,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.onPrimary,
                      fontSize: 20,
                      height: 2.0,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () => _launchUrl(),
                    child: Text(
                      'Clique e saiba mais.',
                      textAlign: TextAlign.justify,
                      style: context.textStyles.textMedium.copyWith(
                        color: context.colors.onPrimary,
                        fontSize: 20,
                        height: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
