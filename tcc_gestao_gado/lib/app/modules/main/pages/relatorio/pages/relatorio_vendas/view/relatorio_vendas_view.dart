import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_mortes/model/vendas_model.dart';

abstract class RelatorioVendasView {
  void showSalesList({required List<VendasModel> salesList});
}
