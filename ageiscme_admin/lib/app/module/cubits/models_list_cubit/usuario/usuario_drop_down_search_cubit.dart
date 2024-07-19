import 'package:ageiscme_data/services/usuario/usuario_service.dart';
import 'package:ageiscme_models/dto/usuario/usuario_drop_down_search_dto.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class UsuarioDropDownSearchCubit extends Cubit<UsuarioDropDownSearchState> {
  UsuarioDropDownSearchCubit()
      : super(UsuarioDropDownSearchState(usuarios: []));

  Future loadDropDownSearch(UsuarioDropDownSearchDTO filter) async {
    emit(
      UsuarioDropDownSearchState(
        usuarios: [],
        loading: true,
      ),
    );
    (String, List<UsuarioDropDownSearchResponseDTO>)? result =
        await UsuarioService().getDropDownSearch(filter);
    if (result == null) return;
    result.$2.sort((a, b) => (a.nome ?? '').compareTo(b.nome ?? ''));
    List<UsuarioDropDownSearchResponseDTO> usuarios = result.$2;
    emit(
      UsuarioDropDownSearchState(
        usuarios: usuarios,
        loaded: true,
      ),
    );
  }

  void clear() => emit(UsuarioDropDownSearchState(usuarios: []));
}

class UsuarioDropDownSearchState {
  List<UsuarioDropDownSearchResponseDTO> usuarios;
  bool loading;
  bool loaded;

  UsuarioDropDownSearchState({
    required this.usuarios,
    this.loading = false,
    this.loaded = false,
  });
}
