import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/pesagem/presenter/pesagem_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/pesagem/view/pesagem_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class PesagemPresenterImpl implements PesagemPresenter {
  late PesagemView _view;

  final MainRepository mainRepository;
  final FirebaseAuth firebaseAuth;

  PesagemPresenterImpl({
    required this.mainRepository,
    required this.firebaseAuth,
  });

  @override
  Future<bool> updatePesagem({
    required String? date,
    required String? numberAnimal,
    required String? weigth,
    required String? oberservations,
  }) async {
    var currentUser = firebaseAuth.currentUser!.uid;

    bool? completedOperation;

    if (currentUser.isNotEmpty) {
      CattleModel cattleModel = CattleModel(
        idUser: currentUser,
        id: numberAnimal,
        date: date,
        weightCattle: weigth,
        observations: oberservations,
      );

      completedOperation = await mainRepository.updateWeighing(cattle: cattleModel);

      if (completedOperation) {
        _view.success('Peso do animal atualizada!');
      } else {
        _view.message('Ops... Algo deu errado!');
      }
    }
    return true;
  }

  //     completedOperation = await mainRepository.updateBreastfeeding(cattle: cattleModel);

  //     if (completedOperation) {
  //       _view.success('Amamentação atualizada!');
  //     } else {
  //       _view.message('Ops... Algo deu errado!');
  //     }
  //   }

  //   return true;
  // }

  @override
  set view(PesagemView view) => _view = view;
}
