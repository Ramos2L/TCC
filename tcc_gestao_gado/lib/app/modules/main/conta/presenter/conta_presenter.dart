import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/conta/view/conta_view.dart';

abstract class ContaPresenter extends GestaoGadoPresenter<ContaView> {
  String? getName();
  String? getEmail();
  String? getPhone();
}
