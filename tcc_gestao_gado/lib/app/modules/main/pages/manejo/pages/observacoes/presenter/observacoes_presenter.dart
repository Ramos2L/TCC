import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/observacoes/view/observacoes_view.dart';

abstract class ObservacoesPresenter extends GestaoGadoPresenter<ObservacoesView> {
  Future<bool> updateAnnotation({
    required String dateObs,
    required String numberAnimal,
    required String observations,
  });
}
