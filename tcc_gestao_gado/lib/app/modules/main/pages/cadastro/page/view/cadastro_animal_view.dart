import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';

abstract class CadastroAnimalView {
  Future<void> getShowListRaca(List<RacaModel> raca);
  void showDatePickerFunc();
  void successRegister();
  void errorRegister();
  void showLoader();
}
