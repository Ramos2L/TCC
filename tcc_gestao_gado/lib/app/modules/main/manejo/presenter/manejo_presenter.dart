import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/view/manejo_view.dart';

abstract class ManejoPresenter extends GestaoGadoPresenter<ManejoView> {
  String? getName();
}
