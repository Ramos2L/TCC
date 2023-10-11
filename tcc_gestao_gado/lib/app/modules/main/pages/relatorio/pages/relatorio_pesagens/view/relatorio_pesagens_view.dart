import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';

abstract class RelatorioPesagensView {
  void showWeighingsList({required List<CattleModel> weighingsList});
}
