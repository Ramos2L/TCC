import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/castrar/presenter/castrar_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/castrar/view/castrar_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class CastrarPresenterImpl implements CastrarPresenter {
  late CastrarView _view;

  final MainRepository mainRepository;
  final FirebaseAuth firebaseAuth;

  CastrarPresenterImpl({required this.mainRepository, required this.firebaseAuth});

  @override
  Future<bool> castrateCattle({
    required String numberController,
    required String dateController,
  }) async {
    try {
      _view.showLoader();

      CattleModel cattleModel = CattleModel();

      var currentUser = firebaseAuth.currentUser;

      if (currentUser!.uid.isNotEmpty) {
        cattleModel = cattleModel.copyWith(
          idUser: currentUser.uid,
          id: numberController,
          date: dateController,
        );
        bool success = await mainRepository.castrateAnimal(cattle: cattleModel);
        if (success) {
          _view.successCastrate();
        } else {
          _view.errorCastrate();
        }
      }

      return true;
    } catch (e) {
      _view.errorCastrate();
      return false;
    }
  }

  @override
  set view(CastrarView view) => _view = view;
}
