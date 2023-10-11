import 'package:tcc_gestao_gado/app/core/models/cattle_model.dart';

abstract class ConsultaView {
  consultCattle(CattleModel cattle);
  void error(String message);
  void showLoader();
}
