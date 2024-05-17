import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/filters/usuario_filter/usuario_filter.dart'; 
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioState(usuarios: []));


  Future loadFilter(UsuarioFilter filter) async {
    emit(
      UsuarioState(
        usuarios: [],
        loading: true,
      ),
    );
    List<UsuarioModel> usuarios = await UsuarioService().Filter(filter);
    emit(
      UsuarioState(
        usuarios: usuarios, 
        loaded: true,
      ),
    ); 
  }

  void clear() => emit(UsuarioState(usuarios: []));
}

class UsuarioState {
  List<UsuarioModel> usuarios;
  bool loading;
  bool loaded;

  UsuarioState({
    required this.usuarios,
    this.loading = false,
    this.loaded = false,
  });
}
