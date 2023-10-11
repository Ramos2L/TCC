import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri url = Uri.parse(
  'https://www.infoteca.cnptia.embrapa.br/infoteca/bitstream/doc/1060129/1/Manual2Capitulo1.pdf',
);

class AdubacaoPage extends StatelessWidget {
  static const routeName = '/adubacao';
  const AdubacaoPage({Key? key}) : super(key: key);

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
                  Image.asset(context.images.adubo),
                  const SizedBox(height: 15),
                  Text(
                    '     Fertilizantes ou adubos são qualquer tipo de substância aplicada ao solo ou tecidos vegetais para prover um ou mais nutrientes essenciais ao crescimento das plantas. São aplicados na agricultura com o intuito de melhorar a produção.',
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
