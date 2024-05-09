import 'package:flutter/foundation.dart';

import 'package:dependencias_comuns/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insumo_movimento_drop_down_search_response_dto.freezed.dart';
part 'insumo_movimento_drop_down_search_response_dto.g.dart';

@unfreezed
sealed class InsumoMovimentoDropDownSearchResponseDTO
    with _$InsumoMovimentoDropDownSearchResponseDTO {
  const InsumoMovimentoDropDownSearchResponseDTO._();
  factory InsumoMovimentoDropDownSearchResponseDTO({
    required int cod,
    String? flagEntradaSaida,
    String? nomeInsumo,
    String? lote,
    DateTime? data,
  }) = _InsumoMovimentoDropDownSearchResponseDTO;

  factory InsumoMovimentoDropDownSearchResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$InsumoMovimentoDropDownSearchResponseDTOFromJson(json);

  static InsumoMovimentoDropDownSearchResponseDTO copy(
          InsumoMovimentoDropDownSearchResponseDTO obj) =>
      InsumoMovimentoDropDownSearchResponseDTO.fromJson(obj.toJson());

  String InsumoMovimentoText() {
    String entradaiSaida = flagEntradaSaida == '1'
        ? 'Entrada'
        : flagEntradaSaida == '2'
            ? 'Saída'
            : '';

    return '(${formatarData(data!)}) $entradaiSaida ${nomeInsumo ?? ''} Lote: ${lote ?? ''}';
  }

  String formatarData(DateTime data) {
    return DateFormat('dd/MM/yyyy').format(data);
  }
}
