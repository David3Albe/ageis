import 'package:freezed_annotation/freezed_annotation.dart';

part 'insumo_movimento_drop_down_search_dto.g.dart';
part 'insumo_movimento_drop_down_search_dto.freezed.dart';

@unfreezed
sealed class InsumoMovimentoDropDownSearchDTO with _$InsumoMovimentoDropDownSearchDTO {
  factory InsumoMovimentoDropDownSearchDTO({
    required int numeroRegistros,
    String? search,
  }) = _InsumoMovimentoDropDownSearchDTO;

  factory InsumoMovimentoDropDownSearchDTO.fromJson(Map<String, Object?> json) =>
      _$InsumoMovimentoDropDownSearchDTOFromJson(json);
}
