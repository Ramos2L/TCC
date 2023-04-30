import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/vendas/presenter/vendas_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/vendas/view/vendas_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class VendasPresenterImpl implements VendasPresenter {
  late VendasView _view;

  final UserStore userStore;
  final FirebaseAuth firebaseAuth;
  final CattleModel cattleModel;
  final MainRepository mainRepository;
  VendasPresenterImpl({
    required this.userStore,
    required this.firebaseAuth,
    required this.cattleModel,
    required this.mainRepository,
  });

  @override
  String? getName() => userStore.user.name;

  @override
  Future<bool> registerVenda({
    required String? numberAnimal,
    required String? weigth,
    required String? price,
    required String? date,
    required String? observations,
  }) async {
    var currentUser = firebaseAuth.currentUser!.uid;

    CattleModel cattleModel = CattleModel();

    if (currentUser.isNotEmpty) {
      cattleModel = cattleModel.copyWith(
        idUser: currentUser,
        id: numberAnimal,
        sex: '',
        quite: '',
        breastfeeding: false,
        numberFather: '',
        numberMother: '',
        race: '',
        date: date,
        weightCattle: weigth,
        price: price,
        observations: observations,
      );

      await mainRepository.updateVenda(cattleModel);
    }
    return true;
  }

  @override
  set view(VendasView view) => _view = view;
}
