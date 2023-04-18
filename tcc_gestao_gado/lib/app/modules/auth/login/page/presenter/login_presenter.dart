import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/view/login_view.dart';

abstract class LoginPresenter extends GestaoGadoPresenter<LoginView> {
  login({required String email, required String password});
}