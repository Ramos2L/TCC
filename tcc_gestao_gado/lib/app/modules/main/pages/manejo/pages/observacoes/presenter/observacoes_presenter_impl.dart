import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/observacoes/presenter/observacoes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/observacoes/view/observacoes_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class ObservacoesPresenterImpl implements ObservacoesPresenter {
  late ObservacoesView _view;

  final MainRepository mainRepository;
  final FirebaseAuth firebaseAuth;

  ObservacoesPresenterImpl({
    required this.mainRepository,
    required this.firebaseAuth,
  });

  @override
  Future<bool> updateAnnotation({
    required String dateObs,
    required String numberAnimal,
    required String observations,
  }) async {
    try {
      _view.showLoader();
      var currentUser = firebaseAuth.currentUser!.uid;
      bool? completedOperation;
      if (currentUser.isNotEmpty) {
        CattleModel cattleModel = CattleModel(
          idUser: currentUser,
          dateObs: dateObs,
          id: numberAnimal,
          observations: observations,
        );

        completedOperation = await mainRepository.updateAnnotation(cattle: cattleModel);

        if (completedOperation) {
          _view.success('Observacao atualizada!');
        } else {
          _view.message('Ops... Algo deu errado! Tente novamente...');
        }
      }

      return true;
    } catch (e) {
      _view.message('Ops... Algo deu errado! Tente novamente...');
      return false;
    }
  }

  @override
  set view(ObservacoesView view) => _view = view;
}
