import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/presenter/cadastro_animal_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/view/cadastro_animal_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class CadastroAnimalPresenterImpl implements CadastroAnimalPresenter {
  late CadastroAnimalView _view;

  final MainRepository mainRepository;
  final CattleModel cattleModel;

  CadastroAnimalPresenterImpl({required this.mainRepository, required this.cattleModel});

  @override
  Future<void> getListRaca() async {
    List<RacaModel> racas = [];

    racas = await mainRepository.findRaces();

    _view.getShowListRaca(racas);
  }

  @override
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
    String? observationsController,
  }) async {
    CattleModel cattleModel = CattleModel();

    cattleModel = cattleModel.copyWith(
      id: numberController,
      sex: gender ?? "",
      quite: quite ?? "Compra",
      breastfeeding: breastfeedingOption,
      numberFather: numberFatherController,
      numberMother: numberMotherController,
      weightCattle: weightController,
      date: dateController,
      race: dropdownValue,
      observations: observationsController,
    );

    await mainRepository.update(cattleModel);

    return true;
  }

  @override
  set view(CadastroAnimalView view) => _view = view;
}
