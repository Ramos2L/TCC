import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/vendas_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/vendas/presenter/relatorio_vendas_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/vendas/view/relatorio_vendas_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class RelatorioVendasPresenterImpl implements RelatorioVendasPresenter {
  late RelatorioVendasView _view;

  final FirebaseAuth firebaseAuth;
  final MainRepository mainRepository;

  RelatorioVendasPresenterImpl({required this.firebaseAuth, required this.mainRepository});

  @override
  Future<bool> getSalesReport() async {
    try {
      final idUser = firebaseAuth.currentUser!.uid;
      List<VendasModel> salesList = [];
      salesList = await mainRepository.salesReport(idUser: idUser);
      _view.showSalesList(salesList: salesList);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  set view(RelatorioVendasView view) => _view = view;
}
