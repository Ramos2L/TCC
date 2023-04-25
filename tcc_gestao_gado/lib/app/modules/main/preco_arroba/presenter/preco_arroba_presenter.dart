import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/preco_arroba/view/preco_arroba_view.dart';

abstract class PrecoArrobaPresenter extends GestaoGadoPresenter<PrecoArrobaView> {
  String? getName();
}
