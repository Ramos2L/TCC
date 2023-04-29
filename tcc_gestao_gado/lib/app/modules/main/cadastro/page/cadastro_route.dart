import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/cadastro_animal_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/presenter/cadastro_animal_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/presenter/cadastro_animal_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/repository/cadastro_repository.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/repository/cadastro_repository_impl.dart';

class CadastroAnimalRoute extends FlutterGetItPageRoute {
  const CadastroAnimalRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<CadastroAnimalPresenter>(
            (i) => CadastroAnimalPresenterImpl(cadastroRepository: i(), cattleModel: i())),
        Bind.lazySingleton<CadastroRepository>(
            (i) => CadastroRepositoryImpl(firebaseFirestore: i())),
      ];

  @override
  WidgetBuilder get page => (context) => CadastroAnimalPage(presenter: context.get());
}
