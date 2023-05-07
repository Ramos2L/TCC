import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/core/models/infos_cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/models/user_model.dart';
import 'package:tcc_gestao_gado/app/core/storage/cattle_storage.dart';
import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/errors/login_errors.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final UserStore userStore;
  final CattleStore cattleStore;

  LoginRepositoryImpl({
    required this.userStore,
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.cattleStore,
  });

  @override
  Future<bool> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;
      await findUserData(userId: uid);

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
        throw UnusualException(message: e.toString());
      }
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }

  @override
  Future<UserModel> findUserData({required String userId}) async {
    try {
      final document = firebaseFirestore.collection("users").doc(userId);

      //Salvando quantidade de dados da fazenda
      await findCattle(userId: userId);

      DocumentSnapshot doc = await document.get();
      Map<String, dynamic> mapUser = {};
      if (doc.data() != null) mapUser = doc.data() as Map<String, dynamic>;

      var user = UserModel.fromMap(mapUser);

      userStore.setUser(userStore.user.copyWith(
        id: userId,
        name: user.name,
        farm: user.farm,
        phone: user.phone,
        email: user.email,
      ));
      userStore.saveUser();

      return user;
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }

  @override
  Future<void> findCattle({required String userId}) async {
    try {
      int qtdAnimals = 0;
      int sexMale = 0;
      int sexFemale = 0;
      final document =
          firebaseFirestore.collection("cattle").where("idUser", isEqualTo: userId).get();

      QuerySnapshot doc = await document;

      for (var data in doc.docs) {
        qtdAnimals = qtdAnimals + 1;
        if (data.get('sex') == "macho") {
          sexMale = sexMale + 1;
        } else if (data.get('sex') == "femea") {
          sexFemale = sexFemale + 1;
        }
      }

      InfosCattleModel infoModel = InfosCattleModel(
        qtdTotalAnimals: qtdAnimals,
        qtdFemale: sexFemale,
        qtdMen: sexMale,
      );

      cattleStore.setCattle(infoModel);
      cattleStore.saveCattle();
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }
}
