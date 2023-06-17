import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/compras_model.dart';

abstract class RelatorioComprasView {
  void showAnimalsBoughtList({required List<ComprasModel> animalsList});
}
