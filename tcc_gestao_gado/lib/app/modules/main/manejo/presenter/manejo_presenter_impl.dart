import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/presenter/manejo_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/view/manejo_view.dart';

class ManejoPresenterImpl implements ManejoPresenter {
  late ManejoView _view;

  final UserStore userStore;

  ManejoPresenterImpl({required this.userStore});

  @override
  String? getName() => userStore.user.name;

  @override
  set view(ManejoView view) => _view = view;
}
