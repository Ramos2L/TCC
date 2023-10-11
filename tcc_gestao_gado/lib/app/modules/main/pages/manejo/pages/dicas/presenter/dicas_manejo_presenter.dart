import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/view/dicas_manejo_view.dart';

abstract class DicasManejoPresenter extends GestaoGadoPresenter<DicasManejoView> {
  Future<bool> getData();
}
