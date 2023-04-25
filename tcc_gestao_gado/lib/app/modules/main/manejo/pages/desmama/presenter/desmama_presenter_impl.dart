import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/desmama/presenter/desmama_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/desmama/view/desmama_view.dart';

class DesmamaPresenterImpl implements DesmamaPresenter {
  late DesmamaView _view;

  DesmamaPresenterImpl();

  @override
  set view(DesmamaView view) => _view = view;
}
