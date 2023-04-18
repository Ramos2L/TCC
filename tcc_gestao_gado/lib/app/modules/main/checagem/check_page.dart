import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';

class CheckPage extends StatefulWidget {
  static const routeName = '/check';

  const CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  StreamSubscription? streamSubscription;

  @override
  void initState() {
    streamSubscription = FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushNamed(context, '/intro_page');
      } else {
        Navigator.pushNamed(context, '/home');
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
