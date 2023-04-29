import 'dart:convert';

class CattleModel {
  //numberCattle == id
  final String? id;
  final String? sex;
  // meio == quite
  final String? quite;
  // amamentando == breastfeeding
  final bool? breastfeeding;
  final String? numberFather;
  final String? numberMother;
  final String? date;
  final String? weightCattle;
  final String? race;
  final String? observations;

  CattleModel({
    this.id,
    this.sex,
    this.quite,
    this.breastfeeding,
    this.numberFather,
    this.numberMother,
    this.date,
    this.weightCattle,
    this.race,
    this.observations,
  });

  CattleModel copyWith({
    String? id,
    String? sex,
    String? quite,
    bool? breastfeeding,
    String? numberFather,
    String? numberMother,
    String? date,
    String? weightCattle,
    String? race,
    String? observations,
  }) {
    return CattleModel(
      id: id ?? this.id,
      sex: sex ?? this.sex,
      quite: quite ?? this.quite,
      breastfeeding: breastfeeding ?? this.breastfeeding,
      numberFather: numberFather ?? this.numberFather,
      numberMother: numberMother ?? this.numberMother,
      date: date ?? this.date,
      weightCattle: weightCattle ?? this.weightCattle,
      race: race ?? this.race,
      observations: observations ?? this.observations,
    );
  }

  Map<String, dynamic> toFirebaseMap() {
    Map<String, dynamic> map = {};

    map['id'] = id;
    map['sex'] = sex;
    map['quite'] = quite;
    map['breastfeeding'] = breastfeeding;
    map['numberFather'] = numberFather;
    map['numberMother'] = numberMother;
    map['date'] = date;
    map['weightCattle'] = weightCattle;
    map['race'] = race;
    map['observations'] = observations;

    return map;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sex': sex,
      'quite': quite,
      'breastfeeding': breastfeeding,
      'numberFather': numberFather,
      'numberMother': numberMother,
      'date': date,
      'weightCattle': weightCattle,
      'race': race,
      'observations': observations,
    };
  }

  factory CattleModel.fromMap(Map<String, dynamic> map) {
    return CattleModel(
      id: map['id'] as String,
      sex: map['sex'] as String,
      quite: map['quite'] as String,
      breastfeeding: map['breastfeeding'] as bool,
      numberFather: map['numberFather'] as String,
      numberMother: map['numberMother'] as String,
      date: map['date'] as String,
      weightCattle: map['weightCattle'] as String,
      race: map['race'] as String,
      observations: map['observations'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CattleModel.fromJson(String source) =>
      CattleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CattleModel(id: $id, sex: $sex, quite: $quite, breastfeeding: $breastfeeding, numberFather: $numberFather, numberMother: $numberMother, date: $date, weightCattle: $weightCattle, race: $race, observations: $observations)';
  }
}