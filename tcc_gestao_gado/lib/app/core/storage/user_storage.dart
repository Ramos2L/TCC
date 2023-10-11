import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/models/user_register_model.dart';

class UserStore {
  final FlutterSecureStorage storage;
  UserStore({required this.storage});

  UserRegisterModel user = UserRegisterModel();
  final _key = "userId";

  void setUser(UserRegisterModel value) => user = value;

  Future<void> saveUser() async {
    await storage.write(key: _key, value: user.toJson());
  }

  Future<void> getUser() async {
    String? value = await storage.read(key: _key);
    if (value != null) setUser(UserRegisterModel.fromJson(value));
  }

  Future<void> deleteUser() async => await storage.delete(key: _key);
}
