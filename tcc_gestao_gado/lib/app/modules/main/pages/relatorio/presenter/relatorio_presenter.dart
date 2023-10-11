import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/view/relatorio_view.dart';

abstract class RelatorioPresenter extends GestaoGadoPresenter<RelatorioView> {
  String? getName();
}
