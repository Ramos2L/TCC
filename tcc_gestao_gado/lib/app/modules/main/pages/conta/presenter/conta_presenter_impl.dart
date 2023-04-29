import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/conta/presenter/conta_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/conta/view/conta_view.dart';

class ContaPresenterImpl implements ContaPresenter {
  late ContaView _view;

  final UserStore userStore;

  ContaPresenterImpl({required this.userStore});

  @override
  String? getName() => userStore.user.name;

  @override
  String? getFarm() => userStore.user.farm;

  @override
  String? getEmail() => userStore.user.email;

  @override
  String? getPhone() => userStore.user.phone;

  @override
  set view(ContaView view) => _view = view;
}