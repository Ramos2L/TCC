import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/mortes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/presenter/relatorio_mortes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/view/relatorio_mortes_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class RelatorioMortesPresenterImpl implements RelatorioMortesPresenter {
  late RelatorioMortesView _view;

  final UserStore userStore;
  final MainRepository mainRepository;

  RelatorioMortesPresenterImpl({required this.userStore, required this.mainRepository});

  @override
  Future<void> getDeathReport() async {
    List<MortesModel> deathList = [];
    deathList = await mainRepository.deathReport(idUser: 'siMN31XrPRZq3SpG6mr5ATEVy8p1');
    print(deathList);
  }

  @override
  set view(RelatorioMortesView view) => _view = view;
}
