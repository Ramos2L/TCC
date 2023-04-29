import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';

abstract class CadastroRepository {
  Future<List<RacaModel>> findRaces();
  Future<void> update(CattleModel cattle);
  Future<List<CattleModel>> findCattle();
}
