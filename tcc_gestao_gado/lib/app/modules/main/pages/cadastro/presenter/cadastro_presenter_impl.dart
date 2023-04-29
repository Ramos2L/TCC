import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/presenter/cadastro_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/view/cadastro_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class CadastroPresenterImpl implements CadastroPresenter {
  late CadastroView _view;

  final UserStore userStore;
  final MainRepository cadastroRepository;

  CadastroPresenterImpl({required this.userStore, required this.cadastroRepository});

  @override
  String? getName() => userStore.user.name;

  @override
  set view(CadastroView view) => _view = view;
}
