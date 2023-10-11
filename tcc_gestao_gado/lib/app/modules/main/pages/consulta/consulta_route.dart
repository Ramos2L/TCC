import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/consulta_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/presenter/consulta_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/consulta/presenter/consulta_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository_impl.dart';

class ConsultaRoute extends FlutterGetItPageRoute {
  const ConsultaRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<ConsultaPresenter>(
            (i) => ConsultaPresenterImpl(userStore: i(), mainRepository: i(), firebaseAuth: i())),
        Bind.lazySingleton<MainRepository>(
            (i) => MainRepositoryImpl(firebaseFirestore: i(), storage: i()))
      ];

  @override
  WidgetBuilder get page => (context) => ConsultaPage(presenter: context.get());
}
