import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/presenter/login_presenter.dart';

import '../view/login_view.dart';

class LoginPresenterImpl implements LoginPresenter {
  late LoginView _view;
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  login({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _view.loginUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _view.userNotFound();
      } else if (e.code == 'wrong-password') {
        _view.userPasswordIncorrect();
      } else {
        _view.genericError(e.toString());
        debugPrint(e.toString());
      }
    }
  }

  @override
  set view(LoginView view) => _view = view;
}
