import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/presenter/cadastro_animal_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/view/cadastro_animal_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class CadastroAnimalPresenterImpl implements CadastroAnimalPresenter {
  late CadastroAnimalView _view;

  final MainRepository mainRepository;

  CadastroAnimalPresenterImpl({required this.mainRepository});

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
    String? type,
    String? observationsController,
  }) async {
    CattleModel cattleModel = CattleModel();

    final firebaseAuth = FirebaseAuth.instance;

    var currentUser = firebaseAuth.currentUser;

    if (currentUser!.uid.isNotEmpty) {
      cattleModel = cattleModel.copyWith(
        id: numberController,
        idUser: currentUser.uid,
        sex: gender ?? "",
        quite: quite ?? "Compra",
        breastfeeding: breastfeedingOption,
        numberFather: numberFatherController,
        numberMother: numberMotherController,
        weightCattle: weightController,
        date: dateController,
        race: dropdownValue,
        type: type,
        observations: observationsController,
        price: "",
      );
      bool success = await mainRepository.update(cattleModel);
      if (success) {
        _view.successRegister();
      } else {
        _view.errorRegister();
      }
    }

    return true;
  }

  @override
  set view(CadastroAnimalView view) => _view = view;
}
