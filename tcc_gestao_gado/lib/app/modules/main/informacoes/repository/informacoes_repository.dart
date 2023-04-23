import 'package:tcc_gestao_gado/app/modules/main/informacoes/model/informacoes_model.dart';

abstract class InformacoesRepository {
  Future<List<InformacoesModel>> findInformation();
}
