import 'dart:convert';

class VendasModel {
  final String? id;
  final String? idUser;
  final String? date;
  final String? price;
  final String? weightCattle;
  final String? observations;
  VendasModel({
    this.id,
    this.idUser,
    this.date,
    this.price,
    this.weightCattle,
    this.observations,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idUser': idUser,
      'date': date,
      'price': price,
      'weightCattle': weightCattle,
      'observations': observations,
    };
  }

  factory VendasModel.fromMap(Map<String, dynamic> map) {
    return VendasModel(
      id: map['id'],
      idUser: map['idUser'],
      date: map['date'],
      price: map['price'],
      weightCattle: map['weightCattle'],
      observations: map['observations'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VendasModel.fromJson(String source) => VendasModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VendasModel(id: $id, idUser: $idUser, date: $date, price: $price, weightCattle: $weightCattle, observations: $observations)';
  }
}
