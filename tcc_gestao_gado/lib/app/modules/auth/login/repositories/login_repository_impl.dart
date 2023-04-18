import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/errors/login_errors.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  LoginRepositoryImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  Future<bool> signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else if (e.code == 'user-disabled') {
        throw UserDisabledException();
      } else {
        throw UnsualException(message: e.toString());
      }
    } catch (e) {
      throw UnsualException(message: e.toString());
    }
  }
}
