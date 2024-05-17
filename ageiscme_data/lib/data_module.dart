import 'package:ageiscme_data/local_storage/local_storage.dart';
import 'package:ageiscme_data/services/historico/historico_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_data/services/processo_leitura_cancelamento_preparo/processo_leitura_cancelamento_preparo_service.dart';
import 'package:ageiscme_data/services/registros_expirar/registros_expirar_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:dependencias_comuns/modular_export.dart';

class DataModule extends Module {
  @override
  void exportedBinds(final Injector i) {
    i.addLazySingleton(LocalStorageRepository.new);
    i.addLazySingleton(AuthenticationStore.new);

    _addServices(i);
  }

  void _addServices(final Injector i) {
    i.add(KitService.new);
    i.add(ItemService.new);
    i.add(ProcessoLeituraCancelamentoPreparoService.new);
    i.add(RegistrosExpirarService.new);
    i.add(HistoricoService.new);
  }
}
