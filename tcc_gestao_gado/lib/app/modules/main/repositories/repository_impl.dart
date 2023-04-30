import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/errors/register_errors.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/informacoes/model/informacoes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/model/dicas_manejo_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class MainRepositoryImpl implements MainRepository {
  final FirebaseFirestore firebaseFirestore;

  MainRepositoryImpl({required this.firebaseFirestore});

  @override
  Future<List<RacaModel>> findRaces() async {
    try {
      final documentGado = firebaseFirestore.collection("raça").get();

      QuerySnapshot docGado = await documentGado;

      List<RacaModel> racas = [];
      for (var data in docGado.docs) {
        racas.add(RacaModel.fromMap(data.data() as Map<String, dynamic>));
      }

      return racas;
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }

  @override
  Future<void> update(CattleModel cattle) async {
    Map<String, dynamic> mapCattle = cattle.toFirebaseMap();

    await firebaseFirestore
        .collection('cattle')
        .doc(mapCattle['id'])
        .set(mapCattle)
        .then((value) => debugPrint('Success'))
        .catchError(
          (onError) => debugPrint('Mensage error'),
        );
    await findCattle();
  }

  @override
  Future<List<CattleModel>> findCattle() async {
    try {
      final document = firebaseFirestore.collection("cattle").get();

      QuerySnapshot doc = await document;

      List<CattleModel> dataInformations = [];
      for (var data in doc.docs) {
        dataInformations.add(CattleModel.fromMap(data.data() as Map<String, dynamic>));
      }

      return dataInformations;
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }

  @override
  Future<List<InformacoesModel>> findInformation() async {
    try {
      final document = firebaseFirestore.collection("informacoes").get();

      QuerySnapshot doc = await document;

      List<InformacoesModel> dataInformations = [];
      for (var data in doc.docs) {
        dataInformations.add(InformacoesModel.fromMap(data.data() as Map<String, dynamic>));
      }

      return dataInformations;
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }

  @override
  Future<List<DicasManejoModel>> findManagementTips() async {
    try {
      final document = firebaseFirestore.collection("dicas_manejo").get();

      QuerySnapshot doc = await document;

      List<DicasManejoModel> dataInformations = [];
      for (var data in doc.docs) {
        dataInformations.add(DicasManejoModel.fromMap(data.data() as Map<String, dynamic>));
      }

      return dataInformations;
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }

  @override
  Future<CattleModel> consultCattle({required String idCattle}) async {
    try {
      final document = firebaseFirestore.collection("cattle").doc(idCattle);

      DocumentSnapshot doc = await document.get();
      Map<String, dynamic> cattleMap = {};
      if (doc.data() != null) cattleMap = doc.data() as Map<String, dynamic>;

      var cattle = CattleModel.fromMap(cattleMap);

      return cattle;
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }
}
