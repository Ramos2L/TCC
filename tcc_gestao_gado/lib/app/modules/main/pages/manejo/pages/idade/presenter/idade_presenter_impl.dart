import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/idade/presenter/idade_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/idade/view/idade_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class IdadePresenterImpl implements IdadePresenter {
  late IdadeView _view;

  final MainRepository mainRepository;
  final FirebaseAuth firebaseAuth;

  IdadePresenterImpl({required this.mainRepository, required this.firebaseAuth});

  @override
  Future<bool> updateAgeCattle({
    required String numberController,
    required String ageCattle,
  }) async {
    try {
      _view.showLoader();

      CattleModel cattleModel = CattleModel();

      var currentUser = firebaseAuth.currentUser;

      if (currentUser!.uid.isNotEmpty) {
        cattleModel = cattleModel.copyWith(
          idUser: currentUser.uid,
          id: numberController,
          ageCattle: ageCattle,
        );
        bool success = await mainRepository.updateAge(cattle: cattleModel);
        if (success) {
          _view.successUpdateAge();
        } else {
          _view.errorUpdateAge();
        }
      }

      return true;
    } catch (e) {
      _view.errorUpdateAge();
      return false;
    }
  }

  @override
  set view(IdadeView view) => _view = view;
}
