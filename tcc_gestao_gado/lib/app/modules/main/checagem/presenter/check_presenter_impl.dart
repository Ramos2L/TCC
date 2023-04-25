import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcc_gestao_gado/app/core/models/user_model.dart';
import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/errors/register_errors.dart';
import 'package:tcc_gestao_gado/app/modules/main/checagem/presenter/check_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/checagem/view/check_view.dart';

class CheckPresenterImpl implements CheckPresenter {
  late CheckView _view;
  final UserStore userStore;

  final FirebaseFirestore firebaseFirestore;

  CheckPresenterImpl({
    required this.userStore,
    required this.firebaseFirestore,
  });

  @override
  Future<void> setUserAndSave({required String userId}) async {
    try {
      final document = firebaseFirestore.collection("users").doc(userId);

      DocumentSnapshot doc = await document.get();
      Map<String, dynamic> mapUser = {};
      if (doc.data() != null) mapUser = doc.data() as Map<String, dynamic>;

      var user = UserModel.fromMap(mapUser);

      userStore.setUser(userStore.user.copyWith(
        id: userId,
        name: user.name,
        phone: user.phone,
        email: user.email,
      ));
      userStore.saveUser();

      _view.toHome();
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }

  @override
  set view(CheckView view) => _view = view;
}