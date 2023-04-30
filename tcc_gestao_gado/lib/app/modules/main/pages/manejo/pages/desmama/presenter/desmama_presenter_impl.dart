import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/desmama/presenter/desmama_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/desmama/view/desmama_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class DesmamaPresenterImpl implements DesmamaPresenter {
  late DesmamaView _view;

  final MainRepository mainRepository;
  final FirebaseAuth firebaseAuth;

  DesmamaPresenterImpl({
    required this.mainRepository,
    required this.firebaseAuth,
  });

  @override
  Future<bool> updateBreastfeeding({
    required String date,
    required String numberAnimal,
    required String observations,
  }) async {
    var currentUser = firebaseAuth.currentUser!.uid;

    if (currentUser.isNotEmpty) {
      CattleModel cattleModel = CattleModel(
        idUser: currentUser,
        id: numberAnimal,
        breastfeeding: false,
        observations: observations,
      );

      await mainRepository.updateBreastfeeding(cattle: cattleModel);
    }

    return true;
  }

  @override
  set view(DesmamaView view) => _view = view;
}
