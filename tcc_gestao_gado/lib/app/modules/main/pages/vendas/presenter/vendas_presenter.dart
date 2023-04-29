import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/vendas/view/vendas_view.dart';

abstract class VendasPresenter extends GestaoGadoPresenter<VendasView> {
  String? getName();
}
