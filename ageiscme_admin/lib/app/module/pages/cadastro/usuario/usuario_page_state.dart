import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class UsuarioPageCubit extends Cubit<UsuarioPageState> {
  final UsuarioService service;
  UsuarioPageCubit({required this.service})
      : super(
          UsuarioPageState(
            usuarios: [],
            loading: false,
          ),
        );

  void loadUsuario() async {
    emit(UsuarioPageState(loading: true, usuarios: []));
    List<UsuarioModel> usuarios = await service.Filter(
      UsuarioFilter(
        tipoQuery: UsuarioFilterTipoQuery.SemFoto,
        carregarFoto: false,
      ),
    );
    emit(UsuarioPageState(loading: false, usuarios: usuarios));
  }

  Future loadFilter(UsuarioFilter filter) async {
    emit(UsuarioPageState(loading: true, usuarios: []));
    List<UsuarioModel> usuarios = await service.Filter(filter);
    emit(UsuarioPageState(loading: false, usuarios: usuarios));
  }

  void delete(UsuarioModel usuario) async {
    try {
      (String, UsuarioModel)? result = await service.delete(usuario);
      if (result == null) return;
      emit(
        UsuarioPageState(
          loading: false,
          usuarios: state.usuarios,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (_) {}
  }
}

class UsuarioPageState {
  final bool loading;
  final bool deleted;
  final List<UsuarioModel> usuarios;
  final String message;

  UsuarioPageState({
    required this.loading,
    required this.usuarios,
    this.deleted = false,
    this.message = '',
  });
}
