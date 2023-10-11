import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/view/recuperate_view.dart';

abstract class RecuperatePresenter extends GestaoGadoPresenter<RecuperateView> {
  void recuperatePassword({required String email});
}
