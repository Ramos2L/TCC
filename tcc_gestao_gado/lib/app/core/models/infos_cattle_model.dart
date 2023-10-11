import 'dart:convert';

class InfosCattleModel {
  final int? qtdTotalAnimals;
  final int? qtdFemale;
  final int? qtdMen;

  InfosCattleModel({
    this.qtdTotalAnimals,
    this.qtdFemale,
    this.qtdMen,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'qtdTotalAnimals': qtdTotalAnimals,
      'qtdFemale': qtdFemale,
      'qtdMen': qtdMen,
    };
  }

  factory InfosCattleModel.fromMap(Map<int, dynamic> map) {
    return InfosCattleModel(
      qtdTotalAnimals: map['qtdTotalAnimals'] as int,
      qtdFemale: map['qtdFemale'] as int,
      qtdMen: map['qtdMen'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfosCattleModel.fromJson(String source) =>
      InfosCattleModel.fromMap(json.decode(source) as Map<int, dynamic>);

  @override
  String toString() {
    return 'InfosCattleModel(qtdTotalAnimals: $qtdTotalAnimals, qtdFemale: $qtdFemale, qtdMen: $qtdMen)';
  }
}
