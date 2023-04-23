import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/view/informacoes_view.dart';

abstract class InformacoesPresenter extends GestaoGadoPresenter<InformacoesView> {
  String? getName();
  Future<bool> getData();
}
