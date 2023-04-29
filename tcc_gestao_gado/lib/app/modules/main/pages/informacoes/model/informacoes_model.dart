import 'dart:convert';

class InformacoesModel {
  final String imagem;
  final String informacao1;
  final String informacao2;
  final String informacao3;

  InformacoesModel(
      {required this.imagem,
      required this.informacao1,
      required this.informacao2,
      required this.informacao3});

  factory InformacoesModel.fromMap(Map<String, dynamic> map) {
    return InformacoesModel(
      imagem: map['imagem'] as String,
      informacao1: map['informacao1'] as String,
      informacao2: map['informacao2'] as String,
      informacao3: map['informacao3'] as String,
    );
  }

  factory InformacoesModel.fromJson(String source) =>
      InformacoesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'InformacoesModel(imagem: $imagem, informacao1: $informacao1, informacao2: $informacao2, informacao3: $informacao3)';
}
