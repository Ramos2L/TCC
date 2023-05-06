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
    try {
      _view.showLoader();
      bool? salePermission;
      var currentUser = firebaseAuth.currentUser!.uid;

      if (currentUser.isNotEmpty) {
        CattleModel cattleModel = CattleModel(
          idUser: currentUser,
          id: numberAnimal,
          date: date,
          weightCattle: weigth,
          price: price,
          observations: observations,
        );

        salePermission = await mainRepository.updateVenda(cattleModel);

        if (salePermission) {
          _view.success('Venda efetivada!');
        } else {
          _view.message('Venda não efetivada, código inválido.');
        }
      }
      return true;
    } catch (e) {
      _view.message('Erro! Venda não efetivada, tente novamente!');
      return false;
    }
  }

  @override
  set view(VendasView view) => _view = view;
}
