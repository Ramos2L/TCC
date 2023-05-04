import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/descarte/view/descarte_view.dart';

abstract class DescartePresenter extends GestaoGadoPresenter<DescarteView> {
  Future<void> registerDiscard({
    required String situation,
    required String date,
    required String idAnimal,
    required String? weigth,
    required String? price,
    required String? observations,
  });
}
