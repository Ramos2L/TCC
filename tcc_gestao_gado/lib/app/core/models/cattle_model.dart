import 'dart:convert';

class CattleModel {
  //numberCattle == id
  final String? id;
  final String? idUser;
  final String? sex;
  // meio == quite
  final String? quite;
  // amamentando == breastfeeding
  final String? ageCattle;
  // idade do animal
  final bool? breastfeeding;
  final String? numberFather;
  final String? numberMother;
  final String? dateRegister;
  final String? date;
  final String? dateWeight;
  final String? dateObs;
  final String? weightCattle;
  final String? race;
  final String? type;
  final String? observations;
  final String? price;
  final String? path;

  CattleModel({
    this.id,
    this.idUser,
    this.sex,
    this.quite,
    this.breastfeeding,
    this.ageCattle,
    this.numberFather,
    this.numberMother,
    this.date,
    this.dateRegister,
    this.dateWeight,
    this.dateObs,
    this.weightCattle,
    this.race,
    this.type,
    this.observations,
    this.price,
    this.path,
  });

  CattleModel copyWith({
    String? id,
    String? idUser,
    String? sex,
    String? quite,
    bool? breastfeeding,
    String? ageCattle,
    String? numberFather,
    String? numberMother,
    String? date,
    String? dateRegister,
    String? dateWeight,
    String? dateObs,
    String? weightCattle,
    String? race,
    String? type,
    String? observations,
    String? price,
    String? path,
  }) {
    return CattleModel(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      sex: sex ?? this.sex,
      quite: quite ?? this.quite,
      breastfeeding: breastfeeding ?? this.breastfeeding,
      ageCattle: ageCattle ?? this.ageCattle,
      numberFather: numberFather ?? this.numberFather,
      numberMother: numberMother ?? this.numberMother,
      date: date ?? this.date,
      dateRegister: dateRegister ?? this.dateRegister,
      dateWeight: dateWeight ?? this.dateWeight,
      dateObs: dateObs ?? this.dateObs,
      weightCattle: weightCattle ?? this.weightCattle,
      race: race ?? this.race,
      type: type ?? this.type,
      observations: observations ?? this.observations,
      price: price ?? this.price,
      path: path ?? this.path,
    );
  }

  Map<String, dynamic> toFirebaseMap() {
    Map<String, dynamic> map = {};

    map['id'] = id;
    map['idUser'] = idUser;
    map['sex'] = sex;
    map['quite'] = quite;
    map['breastfeeding'] = breastfeeding;
    map['ageCattle'] = ageCattle;
    map['numberFather'] = numberFather;
    map['numberMother'] = numberMother;
    map['date'] = date;
    map['dateRegister'] = dateRegister;
    map['dateWeight'] = dateWeight;
    map['dateObs'] = dateObs;
    map['weightCattle'] = weightCattle;
    map['race'] = race;
    map['type'] = type;
    map['observations'] = observations;
    map['price'] = price;
    map['path'] = path;

    return map;
  }

  Map<String, dynamic> toFirebaseMapVendas() {
    Map<String, dynamic> map = {};

    map['id'] = id;
    map['idUser'] = idUser;
    map['date'] = date;
    map['weightCattle'] = weightCattle;
    map['observations'] = observations;
    map['price'] = price;

    return map;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idUser': idUser,
      'sex': sex,
      'quite': quite,
      'breastfeeding': breastfeeding,
      'ageCattle': ageCattle,
      'numberFather': numberFather,
      'numberMother': numberMother,
      'date': date,
      'dateRegister': dateRegister,
      'dateWeight': dateWeight,
      'dateObs': dateObs,
      'weightCattle': weightCattle,
      'race': race,
      'type': type,
      'observations': observations,
      'price': price,
      'path': path,
    };
  }

  factory CattleModel.fromMap(Map<String, dynamic> map) {
    return CattleModel(
      id: map['id'] as String,
      idUser: map['idUser'] as String,
      sex: map['sex'] as String?,
      quite: map['quite'] as String?,
      breastfeeding: map['breastfeeding'] as bool?,
      ageCattle: map['ageCattle'] as String?,
      numberFather: map['numberFather'] as String?,
      numberMother: map['numberMother'] as String?,
      date: map['date'] as String?,
      dateRegister: map['dateRegister'] as String?,
      dateWeight: map['dateWeight'] as String?,
      dateObs: map['dateObs'] as String?,
      weightCattle: map['weightCattle'] as String?,
      race: map['race'] as String?,
      type: map['type'] as String?,
      observations: map['observations'] as String?,
      price: map['price'] as String?,
      path: map['path'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory CattleModel.fromJson(String source) =>
      CattleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CattleModel(id: $id, idUser: $idUser, sex: $sex, quite: $quite, breastfeeding: $breastfeeding, ageCattle: $ageCattle, numberFather: $numberFather, numberMother: $numberMother, dateRegister: $dateRegister, date: $date, dateWeight: $dateWeight, dateObs: $dateObs, weightCattle: $weightCattle, race: $race, type: $type, observations: $observations, price: $price, path: $path)';
  }
}
