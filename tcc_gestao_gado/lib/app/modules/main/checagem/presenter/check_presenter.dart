import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/checagem/view/check_view.dart';

abstract class CheckPresenter extends GestaoGadoPresenter<CheckView> {
  Future<void> setUserAndSave({required String userId});
}