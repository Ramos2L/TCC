import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';

abstract class CadastroRepository {
  Future<List<RacaModel>> findRaces();
}
