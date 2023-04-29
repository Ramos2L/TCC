import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/presenter/consulta_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/view/consulta_view.dart';

class ConsultaPresenterImpl implements ConsultaPresenter {
  late ConsultaView _view;

  final UserStore userStore;

  ConsultaPresenterImpl({required this.userStore});

  @override
  String? getName() => userStore.user.name;

  @override
  set view(ConsultaView view) => _view = view;
}
