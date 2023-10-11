import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_animals/view/relatorio_animals_view.dart';

abstract class RelatorioAnimalsPresenter extends GestaoGadoPresenter<RelatorioAnimalsView> {
  Future<bool> getAnimalsReport();
}
