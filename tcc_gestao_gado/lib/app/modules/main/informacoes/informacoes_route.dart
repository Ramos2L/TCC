import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/informacoes_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/presenter/informacoes_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/presenter/informacoes_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/repository/informacoes_repository.dart';
import 'package:tcc_gestao_gado/app/modules/main/informacoes/repository/informacoes_repository_impl.dart';

class InformacoesRoute extends FlutterGetItPageRoute {
  const InformacoesRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<InformacoesPresenter>((i) => InformacoesPresenterImpl(
              userStore: i(),
              informacoesRepository: i(),
            )),
        Bind.lazySingleton<InformacoesRepository>((i) => InformacoesRepositoryImpl(
              firebaseFirestore: i(),
            )),
      ];

  @override
  WidgetBuilder get page => (context) => InformacoesPage(presenter: context.get());
}
