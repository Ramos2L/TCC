import 'dart:convert';

class MortesModel {
  final String? id;
  final String? idUser;
  final String? date;
  final String? observations;
  MortesModel({
    this.id,
    this.idUser,
    this.date,
    this.observations,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idUser': idUser,
      'date': date,
      'observations': observations,
    };
  }

  factory MortesModel.fromMap(Map<String, dynamic> map) {
    return MortesModel(
      id: map['id'],
      idUser: map['idUser'],
      date: map['date'],
      observations: map['observations'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MortesModel.fromJson(String source) => MortesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MortesModel(id: $id, idUser: $idUser, date: $date, observations: $observations)';
  }
}
