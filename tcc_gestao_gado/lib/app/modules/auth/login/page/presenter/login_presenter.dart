import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/view/login_view.dart';

abstract class LoginPresenter extends GestaoGadoPresenter<LoginView> {
  void signIn({required String email, required String password});
  void dialogFluxo();
  void toRegister();
}
