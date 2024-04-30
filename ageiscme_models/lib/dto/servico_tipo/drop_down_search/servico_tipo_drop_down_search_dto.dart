import 'package:freezed_annotation/freezed_annotation.dart';

part 'servico_tipo_drop_down_search_dto.g.dart';
part 'servico_tipo_drop_down_search_dto.freezed.dart';

@unfreezed
sealed class ServicoTipoDropDownSearchDTO with _$ServicoTipoDropDownSearchDTO {
  factory ServicoTipoDropDownSearchDTO({
    required int numeroRegistros,
    String? search,
  }) = _ServicoTipoDropDownSearchDTO;

  factory ServicoTipoDropDownSearchDTO.fromJson(Map<String, Object?> json) =>
      _$ServicoTipoDropDownSearchDTOFromJson(json);
}
