import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tcc_gestao_gado/app/core/models/infos_cattle_model.dart';

class CattleStore {
  final FlutterSecureStorage storage;
  CattleStore({required this.storage});

  InfosCattleModel cattle = InfosCattleModel();
  final _key = "cattleId";

  void setCattle(InfosCattleModel value) => cattle = value;

  Future<void> saveCattle() async {
    await storage.write(key: _key, value: cattle.toJson());
  }

  Future<void> getCattle() async {
    String? value = await storage.read(key: _key);
    if (value != null) setCattle(InfosCattleModel.fromJson(value));
  }

  Future<void> deleteCattle() async => await storage.delete(key: _key);
}
