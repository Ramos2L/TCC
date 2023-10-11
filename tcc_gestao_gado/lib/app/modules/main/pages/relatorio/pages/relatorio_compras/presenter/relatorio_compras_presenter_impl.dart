import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_compras/presenter/relatorio_compras_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_compras/view/relatorio_compras_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/compras_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class RelatorioComprasPresenterImpl implements RelatorioComprasPresenter {
  late RelatorioComprasView _view;

  final FirebaseAuth firebaseAuth;
  final MainRepository mainRepository;

  RelatorioComprasPresenterImpl({required this.firebaseAuth, required this.mainRepository});

  @override
  Future<bool> getAnimalsBoughtReport() async {
    try {
      final idUser = firebaseAuth.currentUser!.uid;
      List<ComprasModel> animalsList = [];
      animalsList = await mainRepository.findAnimalsBoughtCattle(idUser: idUser);
      _view.showAnimalsBoughtList(animalsList: animalsList);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  set view(RelatorioComprasView view) => _view = view;
}
