import 'package:tcc_gestao_gado/app/core/mvp/gestao_gado_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/view/register_view.dart';

abstract class RegisterPresenter extends GestaoGadoPresenter<RegisterView> {
  Future<bool> registerUser({
    required String nome,
    required String phone,
    required String email,
    required String farm,
    required String password,
  });
}
