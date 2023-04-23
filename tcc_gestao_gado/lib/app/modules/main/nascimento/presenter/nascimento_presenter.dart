import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/nascimento/view/nascimento_view.dart';

abstract class NascimentoPresenter extends GestaoGadoPresenter<NascimentoView> {
  String? getName();
}
