import 'package:flutter/material.dart';

class Images {
  static Images? _instance;

  Images._();

  static Images get i {
    _instance ??= Images._();
    return _instance!;
  }

  String get cow => "assets/icons/cow.png";

  String get splashImage => "assets/images/splash.jpg";
  String get introImage1 => "assets/images/intro_1.jpg";
  String get introImage2 => "assets/images/intro_2.jpg";
  String get introImage3 => "assets/images/intro_3.jpg";
  String get introImage4 => "assets/images/intro_4.jpg";
  //
  String get manejo => "assets/images/manejo.png";
  String get add => "assets/images/add.png";
  String get nascimento => "assets/images/nascimento.png";
  String get precoArroba => "assets/images/precoarroba.png";
  String get vendas => "assets/images/vendas.png";
  String get relatorio => "assets/images/relatorio.png";
  String get informacao => "assets/images/informacao.png";
  String get buscar => "assets/images/buscar.png";
  String get pasto => "assets/images/pasto.png";
  String get ufmt => "assets/images/ufmt.png";
}

extension ImagesAppExtensions on BuildContext {
  Images get images => Images.i;
}
