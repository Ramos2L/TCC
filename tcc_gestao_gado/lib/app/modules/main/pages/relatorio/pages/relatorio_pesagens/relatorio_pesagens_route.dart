import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_pesagens/presenter/relatorio_pesagens_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_pesagens/presenter/relatorio_pesagens_presenter_impl.dart';
import 'package:tcc_gestao_gado/app/modules/main/pages/relatorio/pages/relatorio_pesagens/relatorio_pesagens_page.dart';

class RelatorioPesagensRoute extends FlutterGetItPageRoute {
  const RelatorioPesagensRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RelatorioPesagensPresenter>(
            (i) => RelatorioPesagensPresenterImpl(firebaseAuth: i(), mainRepository: i())),
      ];

  @override
  WidgetBuilder get page => (context) => RelatorioPesagensPage(presenter: context.get());
}
