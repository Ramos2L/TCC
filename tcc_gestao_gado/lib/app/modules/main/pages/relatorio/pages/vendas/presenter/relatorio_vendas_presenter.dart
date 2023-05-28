import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/vendas/view/relatorio_vendas_view.dart';

abstract class RelatorioVendasPresenter extends GestaoGadoPresenter<RelatorioVendasView> {
  Future<bool> getSalesReport();
}
