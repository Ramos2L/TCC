import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/view/cadastro_animal_view.dart';

abstract class CadastroAnimalPresenter extends GestaoGadoPresenter<CadastroAnimalView> {
  Future<List<RacaModel>> getListRaca();
}
