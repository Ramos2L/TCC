import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/home/view/home_view.dart';

abstract class HomePresenter extends GestaoGadoPresenter<HomeView> {
  void dialogFluxo();
  String? getName();
}
