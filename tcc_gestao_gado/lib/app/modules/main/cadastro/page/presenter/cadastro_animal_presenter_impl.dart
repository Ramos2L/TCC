import 'package:tcc_gestao_gado/app/core/models/raca_model.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/presenter/cadastro_animal_presenter.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/page/view/cadastro_animal_view.dart';
import 'package:tcc_gestao_gado/app/modules/main/cadastro/repository/cadastro_repository.dart';

class CadastroAnimalPresenterImpl implements CadastroAnimalPresenter {
  late CadastroAnimalView _view;

  final CadastroRepository cadastroRepository;

  CadastroAnimalPresenterImpl({required this.cadastroRepository});

  @override
  Future<List<RacaModel>> getListRaca() async {
    List<RacaModel> racas = [];

    racas = await cadastroRepository.findRaces();

    //print('TESTE :${racas[0].nome![0]}');
    return racas;
  }

  @override
  set view(CadastroAnimalView view) => _view = view;
}
