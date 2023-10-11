import 'package:tcc_gestao_gado/app/modules/auth/recuperate/presenter/recuperate_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/repositories/recuperate_repository.dart';
import 'package:tcc_gestao_gado/app/modules/auth/recuperate/view/recuperate_view.dart';

class RecuperatePresenterImpl implements RecuperatePresenter {
  late RecuperateView _view;
  final RecuperateRepository recuperateRepository;

  RecuperatePresenterImpl({required this.recuperateRepository});

  @override
  void recuperatePassword({required String email}) async {
    bool isSuccess = await recuperateRepository.recuperatePasswordFirebase(email: email);

    if (isSuccess) _view.loginUser('Email enviado, verifique e altere sua senha!');
    if (!isSuccess) _view.error('Ocorreu um erro, tente novamente...');
  }

  @override
  set view(RecuperateView view) => _view = view;
}
