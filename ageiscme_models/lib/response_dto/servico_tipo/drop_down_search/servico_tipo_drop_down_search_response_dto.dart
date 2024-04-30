import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'servico_tipo_drop_down_search_response_dto.freezed.dart';
part 'servico_tipo_drop_down_search_response_dto.g.dart';

@unfreezed
sealed class ServicoTipoDropDownSearchResponseDTO with _$ServicoTipoDropDownSearchResponseDTO {
  const ServicoTipoDropDownSearchResponseDTO._();
  factory ServicoTipoDropDownSearchResponseDTO({
    required int cod,
    required String nome,
  }) = _ServicoTipoDropDownSearchResponseDTO;

  factory ServicoTipoDropDownSearchResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ServicoTipoDropDownSearchResponseDTOFromJson(json);

  static ServicoTipoDropDownSearchResponseDTO copy(ServicoTipoDropDownSearchResponseDTO obj) =>
      ServicoTipoDropDownSearchResponseDTO.fromJson(obj.toJson());

  String getNome() => nome;
}
