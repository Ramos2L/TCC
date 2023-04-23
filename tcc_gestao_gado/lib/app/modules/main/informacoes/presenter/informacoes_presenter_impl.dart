import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/presenter/informacoes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/view/informacoes_view.dart';

class InformacoesPresenterImpl implements InformacoesPresenter {
  late InformacoesView _view;

  final UserStore userStore;

  InformacoesPresenterImpl({required this.userStore});

  @override
  String? getName() => userStore.user.name;

  @override
  set view(InformacoesView view) => _view = view;
}
