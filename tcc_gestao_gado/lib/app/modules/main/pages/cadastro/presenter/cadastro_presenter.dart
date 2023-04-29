import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/view/cadastro_view.dart';

abstract class CadastroPresenter extends GestaoGadoPresenter<CadastroView> {
  String? getName();
}
