import 'package:freezed_annotation/freezed_annotation.dart';

part 'parametro_sistema_update_indicadores_dto.g.dart';
part 'parametro_sistema_update_indicadores_dto.freezed.dart';

@unfreezed
sealed class ParametroSistemaUpdateIndicadoresDTO
    with _$ParametroSistemaUpdateIndicadoresDTO {
  factory ParametroSistemaUpdateIndicadoresDTO({
    required int cod,
    required int qtdeIndicadores
  }) = _ParametroSistemaUpdateIndicadoresDTO;

  factory ParametroSistemaUpdateIndicadoresDTO.fromJson(Map<String, Object?> json) =>
      _$ParametroSistemaUpdateIndicadoresDTOFromJson(json);
}
