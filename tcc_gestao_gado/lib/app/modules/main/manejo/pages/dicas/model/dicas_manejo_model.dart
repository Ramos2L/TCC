import 'dart:convert';

class DicasManejoModel {
  final String imagem;
  final String informacao1;
  final String informacao2;
  final String informacao3;

  DicasManejoModel(
      {required this.imagem,
      required this.informacao1,
      required this.informacao2,
      required this.informacao3});

  factory DicasManejoModel.fromMap(Map<String, dynamic> map) {
    return DicasManejoModel(
      imagem: map['imagem'] as String,
      informacao1: map['informacao1'] as String,
      informacao2: map['informacao2'] as String,
      informacao3: map['informacao3'] as String,
    );
  }

  factory DicasManejoModel.fromJson(String source) =>
      DicasManejoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DicasManejoModel(imagem: $imagem, informacao1: $informacao1, informacao2: $informacao2, informacao3: $informacao3)';
}
