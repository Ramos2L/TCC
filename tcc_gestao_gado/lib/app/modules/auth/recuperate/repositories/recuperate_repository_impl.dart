import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/repositories/recuperate_repository.dart';

class RecuperateRepositoryImpl implements RecuperateRepository {
  final FirebaseAuth firebaseAuth;

  RecuperateRepositoryImpl({
    required this.firebaseAuth,
  });

  @override
  Future<bool> recuperatePasswordFirebase({required String email}) async {
    try {
      firebaseAuth.sendPasswordResetEmail(email: email);

      return true;
    } catch (e) {
      return false;
    }
  }
}
