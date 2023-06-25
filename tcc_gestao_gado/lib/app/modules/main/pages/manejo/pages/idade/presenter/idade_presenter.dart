import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/idade/view/idade_view.dart';

abstract class IdadePresenter extends GestaoGadoPresenter<IdadeView> {
  Future<bool> updateAgeCattle({required String numberController, required String ageCattle});
}
