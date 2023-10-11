import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/mortes_model.dart';

abstract class RelatorioMortesView {
  void showDeathList({required List<MortesModel> deathList});
}
