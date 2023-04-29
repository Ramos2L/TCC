import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/presenter/relatorio_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/view/relatorio_view.dart';

class RelatorioPresenterImpl implements RelatorioPresenter {
  late RelatorioView _view;

  final UserStore userStore;

  RelatorioPresenterImpl({required this.userStore});

  @override
  String? getName() => userStore.user.name;

  @override
  set view(RelatorioView view) => _view = view;
}
