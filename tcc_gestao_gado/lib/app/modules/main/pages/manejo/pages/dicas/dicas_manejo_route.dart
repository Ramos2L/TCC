import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/dicas_manejo_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/presenter/dicas_manejo_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/dicas/presenter/dicas_manejo_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository.dart';
import 'package:tcc_gestao_gado/app/modules/main/repositories/repository_impl.dart';

class DicasManejoRoute extends FlutterGetItPageRoute {
  const DicasManejoRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<DicasManejoPresenter>(
            (i) => DicasManejoPresenterImpl(manejoRepository: i())),
        Bind.lazySingleton<MainRepository>((i) => MainRepositoryImpl(
              firebaseFirestore: i(),
            )),
      ];

  @override
  WidgetBuilder get page => (context) => DicasManejoPage(presenter: context.get());
}
