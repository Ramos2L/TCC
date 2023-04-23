import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/vendas/presenter/vendas_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/vendas/view/vendas_view.dart';

class VendasPresenterImpl implements VendasPresenter {
  late VendasView _view;

  final UserStore userStore;

  VendasPresenterImpl({required this.userStore});

  @override
  String? getName() => userStore.user.name;

  @override
  set view(VendasView view) => _view = view;
}
