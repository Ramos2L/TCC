import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_pesagens/presenter/relatorio_pesagens_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_pesagens/view/relatorio_pesagens_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class RelatorioPesagensPresenterImpl implements RelatorioPesagensPresenter {
  late RelatorioPesagensView _view;

  final FirebaseAuth firebaseAuth;
  final MainRepository mainRepository;

  RelatorioPesagensPresenterImpl({required this.firebaseAuth, required this.mainRepository});

  @override
  Future<bool> getWeighingsReport() async {
    try {
      final idUser = firebaseAuth.currentUser!.uid;
      List<CattleModel> weighingsList = [];
      weighingsList = await mainRepository.findCattle(idUser: idUser);
      _view.showWeighingsList(weighingsList: weighingsList);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  set view(RelatorioPesagensView view) => _view = view;
}
