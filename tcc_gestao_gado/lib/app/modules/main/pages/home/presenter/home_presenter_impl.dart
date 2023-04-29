import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/home/presenter/home_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/home/view/home_view.dart';

class HomePresenterImpl implements HomePresenter {
  late HomeView _view;

  final UserStore userStore;

  HomePresenterImpl({required this.userStore});

  @override
  String? getName() => userStore.user.name;

  @override
  void dialogFluxo() {
    _view.showDialog();
  }

  @override
  set view(HomeView view) => _view = view;
}
