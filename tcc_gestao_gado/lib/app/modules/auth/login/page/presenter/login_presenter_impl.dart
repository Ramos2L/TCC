import 'package:tcc_gestao_gado/app/modules/auth/login/errors/login_errors.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/page/presenter/login_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/login/repositories/login_repository.dart';

import '../view/login_view.dart';

class LoginPresenterImpl implements LoginPresenter {
  late LoginView _view;
  final LoginRepository loginRepository;

  LoginPresenterImpl({required this.loginRepository});

  @override
  void signIn({required String email, required String password}) async {
    try {
      if (await loginRepository.signIn(email: email, password: password)) {
        _view.loginUser();
      }
    } on UserNotFoundException {
      _view.error('Ops! Não existe este email! Confira seus dados.');
    } on UserDisabledException {
      _view.error('Este Email foi desativado!');
    } on InvalidEmailException {
      _view.error('Email inserido inválido!');
    } on WrongPasswordException {
      _view.error('Senha informada incorreta!');
    } on UnsualException {
      _view.error('Ops... Ocorreu um erro tente novamente!');
    }
  }

  @override
  void dialogFluxo() {
    _view.showDialog();
  }

  @override
  void toRegister() {
    _view.toRegisterPage();
  }

  @override
  set view(LoginView view) => _view = view;
}
