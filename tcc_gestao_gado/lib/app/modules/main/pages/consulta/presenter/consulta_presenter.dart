import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/view/consulta_view.dart';

abstract class ConsultaPresenter extends GestaoGadoPresenter<ConsultaView> {
  String? getName();
  Future<void> getCattle({required String idCattle});
}
