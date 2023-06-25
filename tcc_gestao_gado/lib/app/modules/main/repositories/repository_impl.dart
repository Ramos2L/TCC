import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/models/infos_cattle_model.dart';
import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/core/models/user_model.dart';
import 'package:tcc_gestao_gado/app/core/storage/cattle_storage.dart';
import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/errors/register_errors.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/informacoes/model/informacoes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/model/dicas_manejo_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/compras_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/mortes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/vendas_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class MainRepositoryImpl implements MainRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage storage;

  MainRepositoryImpl({required this.firebaseFirestore, required this.storage});

  @override
  Future<bool> setUserAndSave({required String userId}) async {
    try {
      final document = firebaseFirestore.collection("users").doc(userId);

      DocumentSnapshot doc = await document.get();
      Map<String, dynamic> mapUser = {};
      if (doc.data() != null) mapUser = doc.data() as Map<String, dynamic>;

      var user = UserModel.fromMap(mapUser);

      var userStore = Injector.get<UserStore>();

      userStore.setUser(userStore.user.copyWith(
        id: userId,
        name: user.name,
        farm: user.farm,
        phone: user.phone,
        email: user.email,
      ));
      userStore.saveUser();
      return true;
    } catch (e) {
      //Caso a pessoa tenha uma conta e a mesma é excluida, dados podem ficar em cache retornando
      //erro, parando neste catch, por isso a necessidade de enviar ao login novamente ou criar
      //conta
      return false;
    }
  }

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
      if (cattle.type == "Bezerro" && cattle.numberMother != "") {
        await checkMom(id: cattle.id, idUser: cattle.idUser, numberMother: cattle.numberMother);
      }
      if (cattle.type == "Bezerro" && cattle.numberFather != "") {
        await checkFather(id: cattle.id, idUser: cattle.idUser, numberFather: cattle.numberFather);
      }
      await firebaseFirestore
          .collection('cattle')
          .doc()
          .set(mapCattle)
          .then((value) => debugPrint('Success'))
          .catchError((onError) => debugPrint('message error'));
      await findInfosCattle(userId: cattle.idUser!);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> uploadPhoto(
      {required File path, required String? userId, required String? idCattle}) async {
    File file = path;
    try {
      String ref = 'images/$userId/$idCattle.jpg';
      storage.ref(ref).putFile(file);
      return true;
    } on FirebaseException {
      debugPrint('ERROR UPLOAD PHOTO');
      return false;
    }
  }

  @override
  Future<bool?> checkMom({
    required String? id,
    required String? idUser,
    String? numberMother,
  }) async {
    bool existMother = false;
    String? referenceMother;
    try {
      await firebaseFirestore
          .collection('cattle')
          .where('idUser', isEqualTo: idUser)
          .where('id', isEqualTo: numberMother)
          .where('sex', isEqualTo: 'femea')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          if (doc.reference.id.toString().isNotEmpty) {
            existMother = true;
            referenceMother = doc.reference.id.toString();
          }
        }
      });

      if (existMother && referenceMother != null) {
        await firebaseFirestore
            .collection('cattle')
            .doc(referenceMother)
            .update({'type': 'Vaca'})
            .then((value) => debugPrint('Success Alteracao status mae'))
            .catchError((onError) => debugPrint('message error Alteracao status mae'));
      } else {
        debugPrint('Erro ou nao existe mãe de bezerro');
      }
      return existMother;
    } catch (e) {
      debugPrint('Erro ao consultar mãe de bezerro');
      return false;
    }
  }

  @override
  Future<bool?> checkFather({
    required String? id,
    required String? idUser,
    String? numberFather,
  }) async {
    bool existFather = false;
    String? referenceFather;
    try {
      await firebaseFirestore
          .collection('cattle')
          .where('idUser', isEqualTo: idUser)
          .where('id', isEqualTo: numberFather)
          .where('sex', isEqualTo: 'macho')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          if (doc.reference.id.toString().isNotEmpty) {
            existFather = true;
            referenceFather = doc.reference.id.toString();
          }
        }
      });

      if (existFather && referenceFather != null) {
        await firebaseFirestore
            .collection('cattle')
            .doc(referenceFather)
            .update({'breastfeeding': false, 'type': 'Boi'})
            .then((value) => debugPrint('Success Alteracao status Bezerro'))
            .catchError((onError) => debugPrint('message error Alteracao status Bezerro'));
      } else {
        debugPrint('Erro ou nao existe pai de bezerro');
      }
      return existFather;
    } catch (e) {
      debugPrint('Erro ao consultar pai de bezerro');
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
  Future<CattleModel> consultCattle({required String id, required String idUser}) async {
    try {
      Map<String, dynamic> cattleMap = {};
      Reference? ref;
      String? getDownload;

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
      if (cattle.path!.isNotEmpty) {
        ref = (storage.ref('images/$idUser/$id.jpg'));
        getDownload = await ref.getDownloadURL();
        cattleMap.update('path', (value) => getDownload);
        cattle = CattleModel.fromMap(cattleMap);
      }

      return cattle;
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }

  @override
  Future<String?> checkUserCattle({required CattleModel cattle}) async {
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
      debugPrint('Message error check User Cattle');
      return null;
    }
  }

  @override
  Future<bool> updateWeighing({required CattleModel cattle}) async {
    String? result = await checkUserCattle(cattle: cattle);

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
          .catchError((onError) => debugPrint('message error'));
      return true;
    } else {
      debugPrint('Nao foi possivel realizar a Desmama');
      return false;
    }
  }

  @override
  Future<bool> updateBreastfeeding({required CattleModel cattle}) async {
    try {
      String? result = await checkUserCattle(cattle: cattle);
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
            .catchError((onError) => debugPrint('message error'));
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

  @override
  Future<bool> updateAnnotation({required CattleModel cattle}) async {
    try {
      String? result = await checkUserCattle(cattle: cattle);
      if (result != null) {
        await firebaseFirestore
            .collection('cattle')
            .doc(result)
            .update({
              'dateObs': cattle.dateObs,
              'id': cattle.id,
              'observations': cattle.observations,
            })
            .then((value) => debugPrint('Success Observacoes'))
            .catchError((onError) => debugPrint('message error'));
        return true;
      } else {
        debugPrint('Nao foi possivel realizar a atualizacao de Observacoes');
        return false;
      }
    } catch (e) {
      debugPrint('Nao foi possivel realizar a atualizacao de Observacoes');
      return false;
    }
  }

  @override
  Future<bool> castrateAnimal({required CattleModel cattle}) async {
    try {
      CattleModel consultData = await consultCattle(id: cattle.id!, idUser: cattle.idUser!);

      if (consultData.sex == "macho") {
        String? result = await checkUserCattle(cattle: cattle);

        if (result != null) {
          await firebaseFirestore
              .collection('cattle')
              .doc(result)
              .update({
                'breastfeeding': false,
                'type': 'Boi',
              })
              .then((value) => debugPrint('Success Castração'))
              .catchError((onError) => debugPrint('message error'));
          return true;
        } else {
          debugPrint('Nao foi possivel realizar a castração');
          return false;
        }
      } else {
        debugPrint('Animal sexo invalido!');
        return false;
      }
    } catch (e) {
      debugPrint('Nao foi possivel realizar a castração');
      return false;
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
          .catchError((onError) => debugPrint('message error'));
      await findInfosCattle(userId: cattle.idUser!);
      return true;
    } else {
      debugPrint('Nao foi possivel realizar a venda');
      return false;
    }
  }

  @override
  Future<bool> updateDeath(CattleModel cattle) async {
    String? result = await deleteCattle(cattle: cattle);

    if (result != null) {
      await firebaseFirestore
          .collection('mortes')
          .doc(result)
          .set({
            'date': cattle.date,
            'id': cattle.id,
            'idUser': cattle.idUser,
            'observations': cattle.observations,
          })
          .then((value) => debugPrint('Success Cadastro Morte animal'))
          .catchError((onError) => debugPrint('message error'));
      await findInfosCattle(userId: cattle.idUser!);
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
  Future<List<CattleModel>> findCattle({required String idUser}) async {
    try {
      final document =
          firebaseFirestore.collection("cattle").where("idUser", isEqualTo: idUser).get();
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
  Future<void> findInfosCattle({required String userId}) async {
    try {
      int qtdAnimals = 0;
      int sexMale = 0;
      int sexFemale = 0;
      final document =
          firebaseFirestore.collection("cattle").where("idUser", isEqualTo: userId).get();

      QuerySnapshot doc = await document;

      for (var data in doc.docs) {
        qtdAnimals = qtdAnimals + 1;
        if (data.get('sex') == "macho") {
          sexMale = sexMale + 1;
        } else if (data.get('sex') == "femea") {
          sexFemale = sexFemale + 1;
        }
      }

      InfosCattleModel infoModel = InfosCattleModel(
        qtdTotalAnimals: qtdAnimals,
        qtdFemale: sexFemale,
        qtdMen: sexMale,
      );

      var cattleStore = Injector.get<CattleStore>();

      cattleStore.setCattle(infoModel);
      cattleStore.saveCattle();
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
  Future<List<MortesModel>> deathReport({required String idUser}) async {
    try {
      final document =
          await firebaseFirestore.collection("mortes").where('idUser', isEqualTo: idUser).get();

      List<MortesModel> death = [];
      for (var data in document.docs) {
        death.add(MortesModel.fromMap(data.data()));
      }
      return death;
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }

  @override
  Future<List<VendasModel>> salesReport({required String idUser}) async {
    try {
      final document =
          await firebaseFirestore.collection("vendas").where('idUser', isEqualTo: idUser).get();

      List<VendasModel> sales = [];
      for (var data in document.docs) {
        sales.add(VendasModel.fromMap(data.data()));
      }
      return sales;
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }

  @override
  Future<List<ComprasModel>> findAnimalsBoughtCattle({required String idUser}) async {
    try {
      final document =
          firebaseFirestore.collection("cattle").where("idUser", isEqualTo: idUser).get();
      QuerySnapshot doc = await document;

      List<ComprasModel> dataInformations = [];
      for (var data in doc.docs) {
        dataInformations.add(ComprasModel.fromMap(data.data() as Map<String, dynamic>));
      }
      return dataInformations;
    } catch (e) {
      throw UnusualException(message: e.toString());
    }
  }
}
