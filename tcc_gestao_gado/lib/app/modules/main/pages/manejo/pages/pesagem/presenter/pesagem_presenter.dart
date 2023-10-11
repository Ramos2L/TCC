import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/pesagem/view/pesagem_view.dart';

abstract class PesagemPresenter extends GestaoGadoPresenter<PesagemView> {
  Future<bool> updatePesagem({
    required String? date,
    required String? numberAnimal,
    required String? weigth,
    required String? oberservations,
  });
}
