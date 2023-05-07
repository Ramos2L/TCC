import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/checagem/presenter/check_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/checagem/view/check_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class CheckPresenterImpl implements CheckPresenter {
  late CheckView _view;
  final UserStore userStore;
  final MainRepository mainRepository;
  final FirebaseFirestore firebaseFirestore;

  CheckPresenterImpl({
    required this.userStore,
    required this.firebaseFirestore,
    required this.mainRepository,
  });

  @override
  Future<void> setUserAndSave({required String userId}) async {
    bool response = await mainRepository.setUserAndSave(userId: userId);

    if (response) {
      _view.toHome();
    } else {
      _view.toLogin();
    }
  }

  @override
  Future<void> setCattleAndSave({required String userId}) async {
    await mainRepository.findInfosCattle(userId: userId);
  }

  @override
  set view(CheckView view) => _view = view;
}
