import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pasto/view/pasto_view.dart';

abstract class PastoPresenter extends GestaoGadoPresenter<PastoView> {
  String? getName();
}
