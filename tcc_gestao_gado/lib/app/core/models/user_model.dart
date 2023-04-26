import 'dart:convert';

class UserModel {
  final String? id;
  final String? name;
  final String? farm;
  final String? phone;
  final String? email;

  UserModel({
    required this.id,
    required this.name,
    required this.farm,
    required this.phone,
    required this.email,
  });

  Map<String, dynamic> toFirebaseMap() {
    Map<String, dynamic> map = {};

    map["id"] = id;
    map["name"] = name;
    map["farm"] = farm;
    map["phone"] = phone;
    map["email"] = email;

    return map;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'farm': farm, 'phone': phone, 'email': email};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      farm: map['farm'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserRegisterModel(id: $id, name: $name, farm: $farm, phone: $phone, email: $email)';
  }
}
