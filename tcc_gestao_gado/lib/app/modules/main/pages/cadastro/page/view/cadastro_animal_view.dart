import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';

abstract class CadastroAnimalView {
  void showDatePickerFunc();
  Future<void> getShowListRaca(List<RacaModel> raca);
}
