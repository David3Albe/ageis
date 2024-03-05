import 'package:ageiscme_data/local_storage/local_storage.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:dependencias_comuns/modular_export.dart';

class DataModule extends Module {
  @override
  void exportedBinds(final Injector i) {
    i.addLazySingleton(LocalStorageRepository.new);
    i.addLazySingleton(AuthenticationStore.new);
  }
}
