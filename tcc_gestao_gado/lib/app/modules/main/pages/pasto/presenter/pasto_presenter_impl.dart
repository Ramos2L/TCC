import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/pasto/presenter/pasto_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/pasto/view/pasto_view.dart';

class PastoPresenterImpl implements PastoPresenter {
  late PastoView _view;

  final UserStore userStore;

  PastoPresenterImpl({required this.userStore});

  @override
  String? getName() => userStore.user.name;

  @override
  set view(PastoView view) => _view = view;
}
