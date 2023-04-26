import 'dart:convert';

class UserRegisterModel {
  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? farm;
  final String? password;

  UserRegisterModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.farm,
    this.password,
  });

  UserRegisterModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? farm,
    String? password,
  }) {
    return UserRegisterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      farm: farm ?? this.farm,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toFirebaseMap() {
    Map<String, dynamic> map = {};

    map["id"] = id;
    map["name"] = name;
    map["phone"] = phone;
    map["email"] = email;
    map["farm"] = farm;
    map["password"] = password;

    return map;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'farm': farm,
      'password': password,
    };
  }

  factory UserRegisterModel.fromMap(Map<String, dynamic> map) {
    return UserRegisterModel(
      id: map['id'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      farm: map['farm'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRegisterModel.fromJson(String source) =>
      UserRegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserRegisterModel(id: $id, name: $name, phone: $phone, email: $email, farm: $farm, password: $password)';
  }
}
