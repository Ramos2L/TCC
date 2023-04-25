import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/preco_arroba/presenter/preco_arroba_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/preco_arroba/view/preco_arroba_view.dart';

class PrecoArrobaPresenterImpl implements PrecoArrobaPresenter {
  late PrecoArrobaView _view;

  final UserStore userStore;

  PrecoArrobaPresenterImpl({required this.userStore});

  @override
  String? getName() => userStore.user.name;

  @override
  set view(PrecoArrobaView view) => _view = view;
}
