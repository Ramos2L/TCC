import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/mortes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/presenter/relatorio_mortes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/view/relatorio_mortes_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class RelatorioMortesPresenterImpl implements RelatorioMortesPresenter {
  late RelatorioMortesView _view;

  final FirebaseAuth firebaseAuth;
  final MainRepository mainRepository;

  RelatorioMortesPresenterImpl({required this.firebaseAuth, required this.mainRepository});

  @override
  Future<bool> getDeathReport() async {
    try {
      final idUser = firebaseAuth.currentUser!.uid;
      List<MortesModel> deathList = [];
      deathList = await mainRepository.deathReport(idUser: idUser);
      _view.showDeathList(deathList: deathList);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  set view(RelatorioMortesView view) => _view = view;
}
