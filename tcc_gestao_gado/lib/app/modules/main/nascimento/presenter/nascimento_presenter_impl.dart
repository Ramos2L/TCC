import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/nascimento/presenter/nascimento_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/nascimento/view/nascimento_view.dart';

class NascimentoPresenterImpl implements NascimentoPresenter {
  late NascimentoView _view;

  final UserStore userStore;

  NascimentoPresenterImpl({required this.userStore});

  @override
  String? getName() => userStore.user.name;

  @override
  set view(NascimentoView view) => _view = view;
}
