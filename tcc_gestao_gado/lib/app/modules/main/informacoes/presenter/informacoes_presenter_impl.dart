import 'dart:math';

import 'package:tcc_gestao_gado/app/core/storage/user_storage.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/model/informacoes_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/presenter/informacoes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/repository/informacoes_repository.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/view/informacoes_view.dart';

class InformacoesPresenterImpl implements InformacoesPresenter {
  late InformacoesView _view;
  final InformacoesRepository informacoesRepository;

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
