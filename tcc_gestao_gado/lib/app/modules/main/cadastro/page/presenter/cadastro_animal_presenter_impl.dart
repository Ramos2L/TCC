import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/presenter/cadastro_animal_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/view/cadastro_animal_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/repository/cadastro_repository.dart';

class CadastroAnimalPresenterImpl implements CadastroAnimalPresenter {
  late CadastroAnimalView _view;

  final CadastroRepository cadastroRepository;
  final CattleModel cattleModel;

  CadastroAnimalPresenterImpl({required this.cadastroRepository, required this.cattleModel});

  @override
  Future<void> getListRaca() async {
    List<RacaModel> racas = [];

    racas = await cadastroRepository.findRaces();

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

    await cadastroRepository.update(cattleModel);

    return true;
  }

  @override
  set view(CadastroAnimalView view) => _view = view;
}
