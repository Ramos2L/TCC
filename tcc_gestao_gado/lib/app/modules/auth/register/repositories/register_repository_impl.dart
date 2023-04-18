import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/errors/register_errors.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/models/user_register_model.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  RegisterRepositoryImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  Future<String> register({
    required email,
    required password,
  }) async {
    try {
      String userId = await signIn(
        email: email,
        password: password,
      );

      return userId;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmailException();
      } else if (e.code == 'operation-not-allowed') {
        throw OperationNotAllowedException();
      } else if (e.code == 'weak-password') {
        throw WeakPasswordException();
      } else {
        throw UnsualException(message: e.toString());
      }
    } catch (e) {
      throw UnsualException(message: e.toString());
    }
  }

  @override
  Future<String> signIn({required email, required password}) async {
    //[Criando credencial de user no firebase por meio de email e senha]
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user!.uid;
  }

  @override
  Future<void> update(UserRegisterModel user) async {
    Map<String, dynamic> mapUserData = user.toFirebaseMap();

    await firebaseFirestore
        .collection('users')
        .doc()
        .set(mapUserData)
        .then((value) => debugPrint('Success'))
        .catchError((onError) => debugPrint('Mensage error'));
  }
}
