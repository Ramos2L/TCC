import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/images.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/widgets/circle_avatar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Olá, Lucas',
          style: context.textStyles.textMedium.copyWith(
            color: context.colors.primary,
            fontSize: 18,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          CircleAvatarWidget(
            width: 55,
            height: 55,
            image: context.images.introImage1,
          ),
        ],
        // leading: CircleAvatarWidget(
        //   width: 55,
        //   height: 55,
        //   image: context.images.introImage1,
        // ),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
