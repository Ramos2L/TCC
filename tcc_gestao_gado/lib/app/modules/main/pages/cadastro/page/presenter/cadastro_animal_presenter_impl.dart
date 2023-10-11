import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/presenter/cadastro_animal_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/cadastro/page/view/cadastro_animal_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class CadastroAnimalPresenterImpl implements CadastroAnimalPresenter {
  late CadastroAnimalView _view;

  final MainRepository mainRepository;
  final FirebaseAuth firebaseAuth;

  CadastroAnimalPresenterImpl({required this.mainRepository, required this.firebaseAuth});

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
    String? ageCattle,
    String? numberController,
    String? dateController,
    String? numberMotherController,
    String? numberFatherController,
    String? weightController,
    String? dropdownValue,
    String? type,
    String? observationsController,
    File? path,
  }) async {
    try {
      _view.showLoader();
      String? sexAnimal;

      if ((type == "Vaca" || type == "Novilha")) {
        sexAnimal = "femea";
      }
      if ((type == "Boi" || type == "Touro")) {
        sexAnimal = "macho";
      }

      CattleModel cattleModel = CattleModel();

      var currentUser = firebaseAuth.currentUser;

      if (currentUser!.uid.isNotEmpty) {
        cattleModel = cattleModel.copyWith(
          id: numberController,
          idUser: currentUser.uid,
          sex: gender ?? sexAnimal,
          quite: quite ?? "Compra",
          breastfeeding: breastfeedingOption,
          ageCattle: ageCattle,
          numberFather: numberFatherController,
          numberMother: numberMotherController,
          weightCattle: weightController,
          dateRegister: dateController,
          date: dateController,
          race: dropdownValue,
          type: type,
          observations: observationsController,
          price: "",
          path: path == null ? '' : path.path,
        );
        bool success = await mainRepository.update(cattleModel);
        bool successImage = true;
        if (path != null) {
          successImage = await mainRepository.uploadPhoto(
            path: path,
            userId: cattleModel.idUser,
            idCattle: cattleModel.id,
          );
        }
        if (success && successImage) {
          _view.successRegister();
        } else {
          _view.errorRegister();
        }
      }

      return true;
    } catch (e) {
      _view.errorRegister();
      return false;
    }
  }

  @override
  set view(CadastroAnimalView view) => _view = view;
}
