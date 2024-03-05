import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/perfil_direito/perfil_direito_model.dart';
import 'package:dependencias_comuns/modular_export.dart';

class AccessUserService {
  static Future<bool> validateUserAccess(ItemMenuModel item) async {
    if (item.rights == null) return true;
    final AuthenticationStore store = Modular.get<AuthenticationStore>();
    final AuthenticationResultDTO? authentication =
        await store.GetAuthenticated();
    if (authentication == null) return false;

    for (UsuarioPerfilModel perfil in authentication.usuario!.usuariosPerfis!) {
      for (PerfilDireitoModel direito in perfil.direitos!) {
        if (item.rights!.contains(direito.codDireito)) return true;
      }
    }
    return false;
  }

  static Future<bool> validateUserHasRight(int codDireito) async {
    final AuthenticationStore store = Modular.get<AuthenticationStore>();
    final AuthenticationResultDTO? authentication =
        await store.GetAuthenticated();
    if (authentication == null) return false;

    for (UsuarioPerfilModel perfil in authentication.usuario!.usuariosPerfis!) {
      if (perfil.direitos != null &&
          perfil.direitos!.any((direito) => direito.codDireito == codDireito)) {
        return true;
      }
    }
    return false;
  }
}
