import 'package:ageiscme_models/response_dto/equipamento/drop_down_search/equipamento_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/servico_tipo/drop_down_search/servico_tipo_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'equipamento_manutencao_filter.g.dart';
part 'equipamento_manutencao_filter.freezed.dart';

@unfreezed
sealed class EquipamentoManutencaoFilter with _$EquipamentoManutencaoFilter {
  factory EquipamentoManutencaoFilter({
    int? cod,
    int? numeroRegistros,
    int? codEquipamento,
    int? codTipoServico,
    @JsonKey(name: 'tStamp') String? tStamp,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    EquipamentoDropDownSearchResponseDTO? equipamento,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    ServicoTipoDropDownSearchResponseDTO? servicoTipo,
  }) = _EquipamentoManutencaoFilter;

  factory EquipamentoManutencaoFilter.fromJson(Map<String, Object?> json) =>
      _$EquipamentoManutencaoFilterFromJson(json);

  static EquipamentoManutencaoFilter copy(EquipamentoManutencaoFilter obj) {
    return EquipamentoManutencaoFilter.fromJson(obj.toJson());
  }

  factory EquipamentoManutencaoFilter.empty() => EquipamentoManutencaoFilter(
        cod: null,
        tStamp: null,
      );
}
