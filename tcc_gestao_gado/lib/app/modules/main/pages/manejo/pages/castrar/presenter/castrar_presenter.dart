import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/castrar/view/castrar_view.dart';

abstract class CastrarPresenter extends GestaoGadoPresenter<CastrarView> {
  Future<bool> castrateCattle({required String numberController, required String dateController});
}
