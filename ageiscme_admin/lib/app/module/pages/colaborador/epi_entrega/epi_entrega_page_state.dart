import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EpiEntregaUsuarioPageCubit extends Cubit<EpiEntregaUsuarioPageState> {
  final UsuarioService service;
  EpiEntregaUsuarioPageCubit({required this.service})
      : super(
          EpiEntregaUsuarioPageState(
            usuarios: [],
            loading: false,
          ),
        );

  void loadUsuariosEpiEntrega() async {
    emit(EpiEntregaUsuarioPageState(loading: true, usuarios: []));
    try {
      List<UsuarioModel> usuarios = await service.GetAll();
      usuarios = usuarios
          .where(
            (usuario) => usuario.colaborador == true && usuario.ativo == true,
          )
          .toList();
      emit(
        EpiEntregaUsuarioPageState(
          loading: false,
          usuarios: usuarios,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EpiEntregaUsuarioPageState(
          loading: false,
          usuarios: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(UsuarioModel usuario) async {
    try {
      (String, UsuarioModel)? result = await service.delete(usuario);
      if (result == null) return;
      emit(
        EpiEntregaUsuarioPageState(
          loading: false,
          usuarios: state.usuarios,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EpiEntregaUsuarioPageState(
          loading: false,
          usuarios: state.usuarios,
          error: ex.toString(),
        ),
      );
    }
  }
}

class EpiEntregaUsuarioPageState {
  final bool loading;
  final bool deleted;
  final List<UsuarioModel> usuarios;
  final String error;
  final String message;

  EpiEntregaUsuarioPageState({
    required this.loading,
    required this.usuarios,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
