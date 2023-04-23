import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/errors/register_errors.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/model/informacoes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/repository/informacoes_repository.dart';

class InformacoesRepositoryImpl implements InformacoesRepository {
  final FirebaseFirestore firebaseFirestore;

  InformacoesRepositoryImpl({required this.firebaseFirestore});

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
}
