import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_animals/presenter/relatorio_animals_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_animals/view/relatorio_animals_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class RelatorioAnimalsPresenterImpl implements RelatorioAnimalsPresenter {
  late RelatorioAnimalsView _view;

  final FirebaseAuth firebaseAuth;
  final MainRepository mainRepository;

  RelatorioAnimalsPresenterImpl({required this.firebaseAuth, required this.mainRepository});

  @override
  Future<bool> getAnimalsReport() async {
    try {
      final idUser = firebaseAuth.currentUser!.uid;
      List<CattleModel> animalsList = [];
      animalsList = await mainRepository.findCattle(idUser: idUser);
      _view.showAnimalsList(animalsList: animalsList);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  set view(RelatorioAnimalsView view) => _view = view;
}
