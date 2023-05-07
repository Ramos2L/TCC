import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/informacoes/model/informacoes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/model/dicas_manejo_model.dart';

abstract class MainRepository {
  Future<bool> setUserAndSave({required String userId});
  Future<List<RacaModel>> findRaces();
  Future<bool> update(CattleModel cattle);
  Future<String?> checkId({required String? id, required String? idUser});
  Future<String?> checkUserCattle({required CattleModel cattle});
  Future<bool> updateVenda(CattleModel cattle);
  Future<bool> updateDeath(CattleModel cattle);
  Future<bool> updateWeighing({required CattleModel cattle});
  Future<bool> updateBreastfeeding({required CattleModel cattle});
  Future<bool> castrateAnimal({required CattleModel cattle});
  Future<String?> deleteCattle({required CattleModel cattle});
  Future<List<CattleModel>> findCattle();
  Future<void> findInfosCattle({required String userId});
  Future<List<InformacoesModel>> findInformation();
  Future<List<DicasManejoModel>> findManagementTips();
  Future<CattleModel> consultCattle({required String id, required String idUser});
}
