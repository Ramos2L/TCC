import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/checagem/presenter/check_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/checagem/view/check_view_impl.dart';

class CheckPage extends StatefulWidget {
  static const routeName = '/check';
  final CheckPresenter presenter;

  const CheckPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends CheckViewImpl {
  StreamSubscription? streamSubscription;

  @override
  void initState() {
    streamSubscription = FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Navigator.pushNamed(context, '/intro_page');
      } else {
        await widget.presenter.setUserAndSave(userId: user.uid);
        await widget.presenter.setCattleAndSave(userId: user.uid);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.colors.primary,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
