import 'dart:math';

import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/informacoes/model/informacoes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/informacoes/presenter/informacoes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/informacoes/view/informacoes_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';

class InformacoesPresenterImpl implements InformacoesPresenter {
  late InformacoesView _view;
  final MainRepository informacoesRepository;

  final UserStore userStore;

  InformacoesPresenterImpl({required this.informacoesRepository, required this.userStore});

  @override
  String? getName() => userStore.user.name;

  @override
  Future<bool> getData() async {
    List<InformacoesModel> listInformation = [];
    listInformation = await informacoesRepository.findInformation();
    int numberRandomList = Random().nextInt(listInformation.length);
    _view.showDataInformation(listInformation[numberRandomList]);
    return true;
  }

  @override
  set view(InformacoesView view) => _view = view;
}
