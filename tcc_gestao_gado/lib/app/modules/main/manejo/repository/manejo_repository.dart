import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/dicas/model/dicas_manejo_model.dart';

abstract class ManejoRepository {
  Future<List<DicasManejoModel>> findManagementTips();
}
