import 'package:ageiscme_data/services/perfil_acesso/perfil_acesso_service.dart';
import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/modular_export.dart';

class PerfilAcessoPageCubit extends Cubit<PerfilAcessoPageState> {
  final PerfilAcessoService service;
  PerfilAcessoPageCubit({required this.service})
      : super(
          PerfilAcessoPageState(
            perfisAcessos: [],
            loading: false,
          ),
        );

  void loadPerfilAcesso() async {
    emit(PerfilAcessoPageState(loading: true, perfisAcessos: []));
    try {
      bool possuiPerfilRestrito = await Modular.get<UsuarioService>()
          .UsuarioAtualPossuiPerfilRestrito();
      List<PerfilAcessoModel> perfisAcessos = await service.GetAll();
      if (!possuiPerfilRestrito) {
        perfisAcessos = perfisAcessos
            .where((element) => element.perfilRestrito != true)
            .toList();
      }
      emit(PerfilAcessoPageState(loading: false, perfisAcessos: perfisAcessos));
    } on Exception catch (ex) {
      emit(
        PerfilAcessoPageState(
          loading: false,
          perfisAcessos: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(PerfilAcessoModel perfilAcesso) async {
    try {
      (String, PerfilAcessoModel)? result = await service.delete(perfilAcesso);
      if (result == null) return;

      emit(
        PerfilAcessoPageState(
          loading: false,
          perfisAcessos: state.perfisAcessos,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        PerfilAcessoPageState(
          loading: false,
          perfisAcessos: state.perfisAcessos,
          error: ex.toString(),
        ),
      );
    }
  }
}

class PerfilAcessoPageState {
  final bool loading;
  final bool deleted;
  final List<PerfilAcessoModel> perfisAcessos;
  final String error;
  final String message;

  PerfilAcessoPageState({
    required this.loading,
    required this.perfisAcessos,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
