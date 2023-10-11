import 'dart:convert';

class RacaModel {
  final List? nome;

  RacaModel({
    required this.nome,
  });

  Map<String, dynamic> toFirebaseMap() {
    Map<String, dynamic> map = {};

    map["nome"] = nome;

    return map;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'nome': nome};
  }

  factory RacaModel.fromMap(Map<String, dynamic> map) {
    return RacaModel(
      nome: map['nome'] as List,
    );
  }

  String toJson() => json.encode(toMap());

  factory RacaModel.fromJson(String source) =>
      RacaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RacaModel(nome: $nome)';
  }
}
