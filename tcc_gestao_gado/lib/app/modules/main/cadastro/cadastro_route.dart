import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/cadastro_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/presenter/cadastro_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/presenter/cadastro_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/repository/cadastro_repository.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/repository/cadastro_repository_impl.dart';

class CadastroRoute extends FlutterGetItPageRoute {
  const CadastroRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<CadastroPresenter>(
            (i) => CadastroPresenterImpl(userStore: i(), cadastroRepository: i())),
        Bind.lazySingleton<CadastroRepository>(
            (i) => CadastroRepositoryImpl(firebaseFirestore: i())),
      ];

  @override
  WidgetBuilder get page => (context) => CadastroPage(presenter: context.get());
}
