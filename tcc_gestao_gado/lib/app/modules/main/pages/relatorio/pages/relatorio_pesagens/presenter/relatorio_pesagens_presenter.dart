import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_pesagens/view/relatorio_pesagens_view.dart';

abstract class RelatorioPesagensPresenter extends GestaoGadoPresenter<RelatorioPesagensView> {
  Future<bool> getWeighingsReport();
}
