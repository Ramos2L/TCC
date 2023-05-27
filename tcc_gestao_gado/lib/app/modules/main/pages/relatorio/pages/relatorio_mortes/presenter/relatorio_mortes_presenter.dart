import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/view/relatorio_mortes_view.dart';

abstract class RelatorioMortesPresenter extends GestaoGadoPresenter<RelatorioMortesView> {
  Future<void> getDeathReport();
}
