import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';

abstract class RelatorioAnimalsView {
  void showAnimalsList({required List<CattleModel> animalsList});
}
