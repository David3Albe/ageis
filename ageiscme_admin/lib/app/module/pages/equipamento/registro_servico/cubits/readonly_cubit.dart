import 'package:ageiscme_admin/app/module/pages/equipamento/registro_servico/states/readonly_state.dart';
import 'package:ageiscme_data/stores/authentication/authentication_store.dart';
import 'package:ageiscme_models/dto/authentication_result/authentication_result_dto.dart';
import 'package:ageiscme_models/enums/direito_enum.dart';
import 'package:ageiscme_models/models/usuario_perfil/usuario_perfil_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';

class ReadonlyCubit extends Cubit<ReadonlyState> {
  ReadonlyCubit() : super(ReadonlyState());

  Future setarReadonly() async {
    AuthenticationResultDTO? auth =
        await Modular.get<AuthenticationStore>().GetAuthenticated();
    if (auth?.usuario?.usuariosPerfis == null) {
      emit(ReadonlyState(botaoSalvarReadonly: true));
      return;
    }
    bool readonly = true;
    for (UsuarioPerfilModel perfil in auth!.usuario!.usuariosPerfis!) {
      if (perfil.direitos != null &&
          perfil.direitos!.any(
            (direito) =>
                direito.codDireito == DireitoEnum.ServicosRegistrosManutencao,
          )) {
        readonly = false;
      }
    }

    for (UsuarioPerfilModel perfil in auth.usuario!.usuariosPerfis!) {
      if (perfil.direitos != null &&
          perfil.direitos!.any(
            (direito) =>
                direito.codDireito == DireitoEnum.MonitoramentoConsultaNoCadastro,
          )) {
        readonly = true;
      }
    }
    emit(ReadonlyState(botaoSalvarReadonly: readonly));
  }
}
