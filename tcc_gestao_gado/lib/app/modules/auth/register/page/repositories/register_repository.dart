import 'package:tcc_gestao_gado/app/modules/auth/register/models/user_register_model.dart';

abstract class RegisterRepository {
  Future<String> register({required email, required password});
  Future<String> signIn({required email, required password});
  Future<void> update(UserRegisterModel user);
}
