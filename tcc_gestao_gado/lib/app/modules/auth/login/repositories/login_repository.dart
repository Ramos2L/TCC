import 'package:tcc_gestao_gado/app/core/models/user_model.dart';

abstract class LoginRepository {
  Future<bool> signIn({required String email, required String password});
  Future<UserModel> findUserData({required String userId});
  Future<void> findCattle({required String userId});
}
