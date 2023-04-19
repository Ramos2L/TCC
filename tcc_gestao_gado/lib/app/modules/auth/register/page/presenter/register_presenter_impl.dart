import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/errors/register_errors.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/presenter/register_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/view/register_view.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/repositories/register_repository.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  late RegisterView _view;
  final RegisterRepository registerRepository;

  final UserStore userStore;

  RegisterPresenterImpl({required this.userStore, required this.registerRepository});

  @override
  Future<bool> registerUser({
    required String nome,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      String userId = await registerRepository.register(email: email, password: password);
      debugPrint('UserId: $userId');

      userStore.setUser(
        userStore.user.copyWith(
          id: userId,
          name: nome,
          phone: phone,
          email: email,
          password: password,
        ),
      );

      if (userId.isNotEmpty) {
        await registerRepository.update(userStore.user);
        _view.cadastroSucesso();
      } else {
        //[Mensagem de erro]
        _view.error('Ops, tivemos problemas ao criar seu usúario, tente novamente.');
      }
    } on EmailAlreadyInUseException {
      _view.error('Este Email já está sendo utilizado!');
    } on InvalidEmailException {
      _view.error('Endereço de Email inválido!');
    } on OperationNotAllowedException {
      _view.error('Esta conta de Email não está habilitada');
    } on WeakPasswordException {
      _view.error('Ops, por favor informe uma senha mais forte!');
    } on UnusualException catch (e) {
      _view.error('Ops, algo ocorreu! tente novamente! + ${e.message}');
    }

    return true;
  }

  @override
  set view(RegisterView view) => _view = view;
}
