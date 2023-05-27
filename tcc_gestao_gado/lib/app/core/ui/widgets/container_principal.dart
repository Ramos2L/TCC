import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/core/storage/cattle_storage.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/utils/size_page.dart';

class ContainerPrincipal extends StatefulWidget {
  final bool? refresh;
  const ContainerPrincipal({Key? key, required this.refresh}) : super(key: key);

  @override
  State<ContainerPrincipal> createState() => _ContainerPrincipalState();
}

class _ContainerPrincipalState extends State<ContainerPrincipal> {
  @override
  Widget build(BuildContext context) {
    var data = Injector.get<CattleStore>();

    widget.refresh! ? setState(() {}) : null;
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
                    Image.asset(context.images.cow, width: 25),
                    const SizedBox(width: 10),
                    Text(
                      '${data.cattle.qtdTotalAnimals}  total de animais',
                      style: context.textStyles.textMedium.copyWith(
                        color: context.colors.primary,
                        fontSize: SizePage.isSmallScreenWidth(context) ? 14 : 20,
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
                    const Icon(Icons.male),
                    const SizedBox(width: 10),
                    Text(
                      '${data.cattle.qtdMen} Machos',
                      style: context.textStyles.textMedium.copyWith(
                        color: context.colors.primary,
                        overflow: TextOverflow.ellipsis,
                        fontSize: SizePage.isSmallScreenWidth(context) ? 14 : 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.female),
                    const SizedBox(width: 10),
                    Text(
                      '${data.cattle.qtdFemale} Fêmeas',
                      style: context.textStyles.textMedium.copyWith(
                        color: context.colors.primary,
                        overflow: TextOverflow.ellipsis,
                        fontSize: SizePage.isSmallScreenWidth(context) ? 14 : 20,
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
