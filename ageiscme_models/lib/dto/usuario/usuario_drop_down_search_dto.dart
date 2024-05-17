import 'package:freezed_annotation/freezed_annotation.dart';

part 'usuario_drop_down_search_dto.g.dart';
part 'usuario_drop_down_search_dto.freezed.dart';

@unfreezed
sealed class UsuarioDropDownSearchDTO with _$UsuarioDropDownSearchDTO {
  factory UsuarioDropDownSearchDTO({
    required int numeroRegistros,
    String? search,
    bool? apenasColaboradores,
    bool? apenasAtivos,
  }) = _UsuarioDropDownSearchDTO;

  factory UsuarioDropDownSearchDTO.fromJson(Map<String, Object?> json) =>
      _$UsuarioDropDownSearchDTOFromJson(json);
}
