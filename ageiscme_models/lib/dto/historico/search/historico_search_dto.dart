import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'historico_search_dto.g.dart';
part 'historico_search_dto.freezed.dart';

@unfreezed
sealed class HistoricoSearchDTO with _$HistoricoSearchDTO {
  factory HistoricoSearchDTO({
    required String termo,
    required int numeroRegistros,
    required int pk,
    int? codUsuario,
    UsuarioModel? usuario,
    DateTime? dataInicial,
    DateTime? dataFinal,
  }) = _HistoricoSearchDTO;

  factory HistoricoSearchDTO.fromJson(Map<String, Object?> json) =>
      _$HistoricoSearchDTOFromJson(json);

}
