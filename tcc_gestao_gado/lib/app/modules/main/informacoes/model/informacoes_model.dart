import 'dart:convert';

class InformacoesModel {
  final String imagem;
  final String informacao;

  InformacoesModel({required this.imagem, required this.informacao});

  factory InformacoesModel.fromMap(Map<String, dynamic> map) {
    return InformacoesModel(
      imagem: map['imagem'] as String,
      informacao: map['informacao'] as String,
    );
  }

  factory InformacoesModel.fromJson(String source) =>
      InformacoesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'InformacoesModel(imagem: $imagem, informacao: $informacao)';
}
