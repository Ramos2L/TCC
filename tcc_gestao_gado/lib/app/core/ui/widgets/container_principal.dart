import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/utils/size_page.dart';

class ContainerPrincipal extends StatelessWidget {
  const ContainerPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      context.images.cow,
                      width: 25,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '504 animais',
                      style: context.textStyles.textMedium.copyWith(
                        color: context.colors.primary,
                        fontSize:
                            SizePage.isSmallScreenWidth(context) ? 14 : 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.male),
                    const SizedBox(width: 10),
                    Text(
                      '201',
                      style: context.textStyles.textMedium.copyWith(
                        color: context.colors.primary,
                        fontSize:
                            SizePage.isSmallScreenWidth(context) ? 14 : 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.balance),
                    const SizedBox(width: 10),
                    Text(
                      '6.450.012 peso',
                      style: context.textStyles.textMedium.copyWith(
                        color: context.colors.primary,
                        fontSize:
                            SizePage.isSmallScreenWidth(context) ? 14 : 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.female),
                    const SizedBox(width: 10),
                    Text(
                      '201',
                      style: context.textStyles.textMedium.copyWith(
                        color: context.colors.primary,
                        fontSize:
                            SizePage.isSmallScreenWidth(context) ? 14 : 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
