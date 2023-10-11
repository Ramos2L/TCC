import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/idade/idade_page.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/idade/presenter/idade_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/manejo/pages/idade/presenter/idade_presenter_impl.dart';

class IdadeRoute extends FlutterGetItPageRoute {
  const IdadeRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<IdadePresenter>(
            (i) => IdadePresenterImpl(mainRepository: i(), firebaseAuth: i())),
      ];

  @override
  WidgetBuilder get page => (context) => IdadePage(presenter: context.get());
}
