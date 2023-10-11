import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_compras/view/relatorio_compras_view.dart';

abstract class RelatorioComprasPresenter extends GestaoGadoPresenter<RelatorioComprasView> {
  //bought -> comprados
  Future<bool> getAnimalsBoughtReport();
}
