import 'dart:io';

import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/informacoes/model/informacoes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/model/dicas_manejo_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/compras_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/mortes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/vendas_model.dart';

abstract class MainRepository {
  Future<bool> setUserAndSave({required String userId});
  Future<List<RacaModel>> findRaces();
  Future<bool> update(CattleModel cattle);
  Future<bool> uploadPhoto({
    required File path,
    required String? userId,
    required String? idCattle,
  });
  Future<bool?> checkMom({
    required String? id,
    required String? idUser,
    required String numberMother,
  });
  Future<bool?> checkFather({
    required String? id,
    required String? idUser,
    String? numberFather,
  });
  Future<String?> checkId({required String? id, required String? idUser});
  Future<String?> checkUserCattle({required CattleModel cattle});
  Future<bool> updateVenda(CattleModel cattle);
  Future<bool> updateDeath(CattleModel cattle);
  Future<bool> updateWeighing({required CattleModel cattle});
  Future<bool> updateBreastfeeding({required CattleModel cattle});
  Future<bool> updateAnnotation({required CattleModel cattle});
  Future<bool> castrateAnimal({required CattleModel cattle});
  Future<String?> deleteCattle({required CattleModel cattle});
  Future<List<CattleModel>> findCattle({required String idUser});
  Future<void> findInfosCattle({required String userId});
  Future<List<InformacoesModel>> findInformation();
  Future<List<DicasManejoModel>> findManagementTips();
  Future<CattleModel> consultCattle({required String id, required String idUser});
  Future<List<MortesModel>> deathReport({required String idUser});
  Future<List<VendasModel>> salesReport({required String idUser});
  Future<List<ComprasModel>> findAnimalsBoughtCattle({required String idUser});
}
