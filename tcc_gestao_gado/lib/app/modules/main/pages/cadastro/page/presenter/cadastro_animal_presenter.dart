import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/view/cadastro_animal_view.dart';

abstract class CadastroAnimalPresenter extends GestaoGadoPresenter<CadastroAnimalView> {
  Future<void> getListRaca();
  Future<bool> registerCattle({
    String? gender,
    String? quite,
    bool? breastfeedingOption,
    String? numberController,
    String? dateController,
    String? numberMotherController,
    String? numberFatherController,
    String? weightController,
    String? dropdownValue,
    String? type,
    String? observationsController,
  });
}
