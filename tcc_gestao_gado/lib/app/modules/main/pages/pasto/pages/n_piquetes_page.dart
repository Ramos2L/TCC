import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri url = Uri.parse(
  'https://www.pastoextraordinario.com.br/saiba-calcular-o-numero-de-piquetes-do-pasto-para-o-manejo-rotacionado.html#:~:text=N%C2%BA%20de%20piquetes%20%3D%20PD%2FPO,atingindo%20mais%20de%2030%20dias.',
);

class NPiquetesPage extends StatelessWidget {
  static const routeName = '/n_piquetes';
  const NPiquetesPage({Key? key}) : super(key: key);

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
                  Image.asset(context.images.piquete),
                  const SizedBox(height: 15),
                  Text(
                    '     O número de piquetes é definido pelo período de descanso (PD) e período de ocupação (PO), pela seguinte fórmula: \nNº de piquetes = PD/PO + 1.\nComo o PD é definido pela altura da planta e não pelo número de dias, estima-se que em sistemas intensivos com elevadas produtividades, o PD médio seja de 15 a 20 dias. Já em sistemas que ainda não exploram o potencial da planta, o PD pode ser maior, atingindo mais de 30 dias.',
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
