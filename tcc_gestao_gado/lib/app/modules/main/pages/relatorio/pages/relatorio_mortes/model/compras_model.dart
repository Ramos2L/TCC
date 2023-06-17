import 'dart:convert';

class ComprasModel {
  final String? id;
  final String? idUser;
  final String? date;
  final String? observations;
  ComprasModel({
    this.id,
    this.idUser,
    this.date,
    this.observations,
  });

  ComprasModel copyWith({
    String? id,
    String? idUser,
    String? date,
    String? observations,
  }) {
    return ComprasModel(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      date: date ?? this.date,
      observations: observations ?? this.observations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idUser': idUser,
      'date': date,
      'observations': observations,
    };
  }

  factory ComprasModel.fromMap(Map<String, dynamic> map) {
    return ComprasModel(
      id: map['id'],
      idUser: map['idUser'],
      date: map['date'],
      observations: map['observations'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ComprasModel.fromJson(String source) => ComprasModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ComprasModel(id: $id, idUser: $idUser, date: $date, observations: $observations)';
  }
}
