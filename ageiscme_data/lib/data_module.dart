import 'package:ageiscme_data/local_storage/local_storage.dart';
import 'package:ageiscme_data/services/anormalidade/anormalidade_service.dart';
import 'package:ageiscme_data/services/anormalidade_tipo/anormalidade_tipo_service.dart';
import 'package:ageiscme_data/services/gerar_licenca/gerar_licenca_service.dart';
import 'package:ageiscme_data/services/historico/historico_service.dart';
import 'package:ageiscme_data/services/imagem/imagem_service.dart';
import 'package:ageiscme_data/services/item/item_service.dart';
import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_data/services/processo_leitura_cancelamento_preparo/processo_leitura_cancelamento_preparo_service.dart';
import 'package:ageiscme_data/services/processo_registro/processo_registro_service.dart';
import 'package:ageiscme_data/services/registros_expirar/registros_expirar_service.dart';
import 'package:ageiscme_data/services/sigla/sigla_service.dart';
import 'package:ageiscme_data/services/turno/sigla_service.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_mixins/mixins/image/image_service_mixin.dart';
import 'package:dependencias_comuns/modular_export.dart';

class DataModule extends Module {
  @override
  void exportedBinds(final Injector i) {
    i.addLazySingleton(LocalStorageRepository.new);
    i.addLazySingleton(AuthenticationStore.new);

    _addServices(injector: i);
    _addMixins(injector: i);
  }

  void _addMixins({
    required final Injector injector,
  }) {
    injector.add<ImageServiceMixin>(ImagemService.new);
  }

  void _addServices({
    required final Injector injector,
  }) {
    injector.add(KitService.new);
    injector.add(ItemService.new);
    injector.add(ProcessoLeituraCancelamentoPreparoService.new);
    injector.add(RegistrosExpirarService.new);
    injector.add(HistoricoService.new);
    injector.add(GerarLicencaService.new);
    injector.add(AnormalidadeTipoService.new);
    injector.add(AnormalidadeService.new);
    injector.add(ProcessoRegistroService.new);
    injector.add(SiglaService.new);
    injector.add(TurnoService.new);
  }
}
