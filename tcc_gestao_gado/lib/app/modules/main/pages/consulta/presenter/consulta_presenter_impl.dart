import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/errors/register_errors.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/presenter/consulta_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/view/consulta_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class ConsultaPresenterImpl implements ConsultaPresenter {
  late ConsultaView _view;

  final UserStore userStore;
  final MainRepository mainRepository;
  final FirebaseAuth firebaseAuth;
  ConsultaPresenterImpl(
      {required this.userStore, required this.mainRepository, required this.firebaseAuth});

  @override
  String? getName() => userStore.user.name;

  @override
  Future<void> getCattle({required String idCattle}) async {
    try {
      _view.showLoader();
      var idUser = firebaseAuth.currentUser;

      if (idUser!.uid.isNotEmpty) {
        CattleModel cattle = await mainRepository.consultCattle(
          id: idCattle,
          idUser: idUser.uid,
        );
        print('TESTE');
        _view.consultCattle(cattle);
      } else {
        debugPrint('ERROR, IDUSER.UID IS NULL');
      }
    } on UnusualException {
      _view.error('Ops... Não existe animal com este código!');
    }
  }

  @override
  set view(ConsultaView view) => _view = view;
}
