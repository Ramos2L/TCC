import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/descarte/presenter/descarte_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/descarte/view/descarte_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class DescartePresenterImpl implements DescartePresenter {
  late DescarteView _view;

  final FirebaseAuth firebaseAuth;
  final MainRepository mainRepository;

  DescartePresenterImpl({
    required this.firebaseAuth,
    required this.mainRepository,
  });

  @override
  Future<void> registerDiscard({
    required String situation,
    required String date,
    required String idAnimal,
    required String? weigth,
    required String? price,
    required String? observations,
  }) async {
    try {
      var currentUser = firebaseAuth.currentUser!.uid;
      if (situation == "morte") {
        bool? deathPermission;

        if (currentUser.isNotEmpty) {
          CattleModel cattleModel = CattleModel(
            idUser: currentUser,
            id: idAnimal,
            date: date,
            observations: observations,
          );

          deathPermission = await mainRepository.updateDeath(cattleModel);

          if (deathPermission) {
            _view.success('Cadastro de morte realizado :(');
          } else {
            _view.message('Cadastro de morte não efetivada, código inválido.');
          }
        }
      } else if (situation == "venda") {
        bool? salePermission;

        if (currentUser.isNotEmpty) {
          CattleModel cattleModel = CattleModel(
            idUser: currentUser,
            id: idAnimal,
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
      }
    } catch (e) {}
  }

  @override
  set view(DescarteView view) => _view = view;
}
