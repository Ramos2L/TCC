import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';

class SobrePage extends StatelessWidget {
  static const routeName = '/sobre';

  const SobrePage({Key? key}) : super(key: key);

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
                            color: context.colors.onPrimary,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Image.asset(context.images.ufmt),
                  const SizedBox(height: 15),
                  Text(
                    '     Este aplicativo para gestão de gado é um trabalho fruto da conclusão de curso da graduação de Ciência da Computação da Universidade de Mato Grosso. \n      Em suma, o aplicativo de gestão de gado é uma solução prática e inovadora para produtores que desejam melhorar a qualidade da produção, ajudando os produtores a tomar decisões mais informadas a garantir a saúde dos animais e aumentar a rentabilidade do negócio.  ',
                    textAlign: TextAlign.justify,
                    style: context.textStyles.textMedium.copyWith(
                      color: context.colors.onPrimary,
                      fontSize: 20,
                      height: 2.0,
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
}
