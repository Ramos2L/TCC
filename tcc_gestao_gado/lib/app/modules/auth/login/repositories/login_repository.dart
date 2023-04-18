abstract class LoginRepository {
  Future<bool> signIn({required String email, required String password});
}
