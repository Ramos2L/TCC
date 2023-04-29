import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/informacoes/informacoes_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/informacoes/presenter/informacoes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/informacoes/presenter/informacoes_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository_impl.dart';

class InformacoesRoute extends FlutterGetItPageRoute {
  const InformacoesRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<InformacoesPresenter>((i) => InformacoesPresenterImpl(
              userStore: i(),
              informacoesRepository: i(),
            )),
        Bind.lazySingleton<MainRepository>((i) => MainRepositoryImpl(
              firebaseFirestore: i(),
            )),
      ];

  @override
  WidgetBuilder get page => (context) => InformacoesPage(presenter: context.get());
}
