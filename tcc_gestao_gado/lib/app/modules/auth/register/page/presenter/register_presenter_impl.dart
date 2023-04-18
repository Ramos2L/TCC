import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/presenter/register_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/repositories/register_repository.dart';
import 'package:tcc_gestao_gado/app/modules/auth/register/page/view/register_view.dart';

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
    userStore.setUser(
      userStore.user.copyWith(
        id: "xxx",
        name: nome,
        phone: phone,
        email: email,
        password: password,
      ),
    );

    String userId = await registerRepository.register(email: email, password: password);
    debugPrint('UserId: $userId');
    if (userId.isNotEmpty) {
      await registerRepository.update(userStore.user);
      _view.cadastroSucesso();
    } else {
      //[Mensagem de erro]
    }

    return true;
  }

  @override
  set view(RegisterView view) => _view = view;
}
