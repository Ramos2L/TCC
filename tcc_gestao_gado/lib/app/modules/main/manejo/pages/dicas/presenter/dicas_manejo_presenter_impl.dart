import 'dart:math';

import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/dicas/model/dicas_manejo_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/dicas/presenter/dicas_manejo_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/pages/dicas/view/dicas_manejo_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/manejo/repository/manejo_repository.dart';

class DicasManejoPresenterImpl implements DicasManejoPresenter {
  late DicasManejoView _view;

  final ManejoRepository manejoRepository;

  DicasManejoPresenterImpl({required this.manejoRepository});

  @override
  Future<bool> getData() async {
    List<DicasManejoModel> listData = [];
    listData = await manejoRepository.findManagementTips();
    _view.showDataManagementTips(listData[Random().nextInt(listData.length)]);
    return true;
  }

  @override
  set view(DicasManejoView view) => _view = view;
}
