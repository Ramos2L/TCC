import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/presenter/cadastro_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/view/cadastro_view.dart';

class CadastroPresenterImpl implements CadastroPresenter {
  late CadastroView _view;

  final UserStore userStore;

  CadastroPresenterImpl({required this.userStore});

  @override
  String? getName() => userStore.user.name;

  @override
  set view(CadastroView view) => _view = view;
}
