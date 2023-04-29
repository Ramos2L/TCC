import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/errors/register_errors.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/repository/cadastro_repository.dart';

class CadastroRepositoryImpl implements CadastroRepository {
  final FirebaseFirestore firebaseFirestore;

  CadastroRepositoryImpl({required this.firebaseFirestore});

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

    print('mapCattle');
    print(mapCattle);

    await firebaseFirestore
        .collection('cattle')
        .doc(mapCattle['id'])
        .set(mapCattle)
        .then((value) => debugPrint('Success'))
        .catchError((onError) => debugPrint('Mensage error'));
  }
}
