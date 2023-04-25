import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/errors/register_errors.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/dicas/model/dicas_manejo_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/repository/manejo_repository.dart';

class ManejoRepositoryImpl implements ManejoRepository {
  final FirebaseFirestore firebaseFirestore;

  ManejoRepositoryImpl({required this.firebaseFirestore});

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
}
