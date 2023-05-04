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
  Future<bool> update(CattleModel cattle) async {
    Map<String, dynamic> mapCattle = cattle.toFirebaseMap();

    String? idCheck = await checkId(id: cattle.id, idUser: cattle.idUser);
    if (idCheck == null) {
      await firebaseFirestore
          .collection('cattle')
          .doc()
          .set(mapCattle)
          .then((value) => debugPrint('Success'))
          .catchError(
            (onError) => debugPrint('message error'),
          );
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String?> checkId({required String? id, required String? idUser}) async {
    String? idCheck;

    try {
      await firebaseFirestore
          .collection('cattle')
          .where("idUser", isEqualTo: idUser)
          .where("id", isEqualTo: id)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          idCheck = doc.reference.id.toString();
        }
      });

      return idCheck;
    } catch (e) {
      debugPrint('Message error Pesagem');
      return null;
    }
  }

  @override
  Future<bool> updateWeighing({required CattleModel cattle}) async {
    String? result = await canWeighing(cattle: cattle);

    if (result != null) {
      await firebaseFirestore
          .collection('cattle')
          .doc(result)
          .update({
            'date': cattle.date,
            'id': cattle.id,
            'weightCattle': cattle.weightCattle,
            'observations': cattle.observations,
          })
          .then((value) => debugPrint('Success Pesagem'))
          .catchError(
            (onError) => debugPrint('message error'),
          );
      return true;
    } else {
      debugPrint('Nao foi possivel realizar a Desmama');
      return false;
    }
  }

  @override
  Future<String?> canWeighing({required CattleModel cattle}) async {
    Map<String, dynamic> mapCattle = cattle.toFirebaseMap();

    String? referenceId;

    try {
      await firebaseFirestore
          .collection('cattle')
          .where("idUser", isEqualTo: mapCattle['idUser'])
          .where("id", isEqualTo: mapCattle['id'])
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          referenceId = doc.reference.id.toString();
        }
      });

      return referenceId;
    } catch (e) {
      debugPrint('Message error Pesagem');
      return null;
    }
  }

  @override
  Future<bool> updateBreastfeeding({required CattleModel cattle}) async {
    try {
      String? result = await canWean(cattle: cattle);
      String? sex;

      var cattleModel = await consultCattle(
        id: cattle.id.toString(),
        idUser: cattle.idUser.toString(),
      );

      //Sempre será null o sexo, porém, a verificação é caso acontece algum cadastro errado
      //ou desatualizado

      if (result != null && cattleModel.sex != null) {
        if (cattleModel.sex == "macho") {
          sex = "Touro";
        } else if (cattleModel.sex == "femea") {
          sex = "Novilha";
        }
        await firebaseFirestore
            .collection('cattle')
            .doc(result)
            .update({
              'breastfeeding': cattle.breastfeeding,
              'observations': cattle.observations,
              'type': sex,
            })
            .then((value) => debugPrint('Success Desmama'))
            .catchError(
              (onError) => debugPrint('message error'),
            );
        return true;
      } else {
        debugPrint('Nao foi possivel realizar a Desmama');
        return false;
      }
    } catch (e) {
      debugPrint('Nao foi possivel realizar a Desmama');
      return false;
    }
  }

  //canWean == pode desmamar?
  @override
  Future<String?> canWean({required CattleModel cattle}) async {
    Map<String, dynamic> mapCattle = cattle.toFirebaseMap();
    String? referenceId;

    try {
      await firebaseFirestore
          .collection('cattle')
          .where("idUser", isEqualTo: mapCattle['idUser'])
          .where("id", isEqualTo: mapCattle['id'])
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          referenceId = doc.reference.id.toString();
        }
      });

      return referenceId;
    } catch (e) {
      debugPrint('message error Desmamar');
      return null;
    }
  }

  @override
  Future<bool> updateVenda(CattleModel cattle) async {
    Map<String, dynamic> mapCattle = cattle.toFirebaseMapVendas();

    String? result = await deleteCattle(cattle: cattle);

    if (result != null) {
      await firebaseFirestore
          .collection('vendas')
          .doc(result)
          .set(mapCattle)
          .then((value) => debugPrint('Success Venda'))
          .catchError(
            (onError) => debugPrint('message error'),
          );
      return true;
    } else {
      debugPrint('Nao foi possivel realizar a venda');
      return false;
    }
  }

  @override
  Future<bool> updateDeath(CattleModel cattle) async {
    Map<String, dynamic> mapCattle = cattle.toFirebaseMapVendas();

    String? result = await deleteCattle(cattle: cattle);

    if (result != null) {
      await firebaseFirestore
          .collection('mortes')
          .doc(result)
          .set({
            'date': cattle.date,
            'id': cattle.id,
            'observations': cattle.observations,
          })
          .then((value) => debugPrint('Success Cadastro Morte animal'))
          .catchError(
            (onError) => debugPrint('message error'),
          );
      return true;
    } else {
      debugPrint('Nao foi possivel realizar o cadastro Morte do animal');
      return false;
    }
  }

  @override
  Future<String?> deleteCattle({required CattleModel cattle}) async {
    Map<String, dynamic> mapCattle = cattle.toFirebaseMap();
    String? refenceId;

    try {
      await firebaseFirestore
          .collection('cattle')
          .where("idUser", isEqualTo: mapCattle['idUser'])
          .where("id", isEqualTo: mapCattle['id'])
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          refenceId = doc.reference.id.toString();
          doc.reference.delete();
        }
      });

      return refenceId;
    } catch (e) {
      debugPrint('message error Delecao');
      return null;
    }
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
  Future<CattleModel> consultCattle({required String id, required String idUser}) async {
    try {
      Map<String, dynamic> cattleMap = {};

      await firebaseFirestore
          .collection("cattle")
          .where("idUser", isEqualTo: idUser)
          .where("id", isEqualTo: id)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          cattleMap = doc.data() as Map<String, dynamic>;
        }
      });

      var cattle = CattleModel.fromMap(cattleMap);

      return cattle;
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }
}
