import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:ageiscme_models/response_dto/item_descritor/drop_down_search/item_descritor_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_item_filter.g.dart';
part 'consulta_item_filter.freezed.dart';

@unfreezed
sealed class ConsultaItemFilter with _$ConsultaItemFilter {
  const ConsultaItemFilter._();

  factory ConsultaItemFilter({
    required int? codItemDescritor,
    required int? codItem,
    required String? idEtiquetaContem,
    required String? codSituacao,
    required int? codGrupo,
    required String? codBarraKitContem,
    required int? codKit,
    required int? codProprietario,
    required int? numeroPatrimonio,
    required String? descricaoCurtaItem,
    required double? cmInicio,
    required double? cmTermino,
    required bool? repositorio,
    required bool? considerarRepositorio,
    required bool? descarte,
    required bool? rotulado,
    required bool? implantavel,
    int? numeroRegistros,
    ItemModel? item,
    ItemDescritorDropDownSearchResponseDTO? itemDescritor,
  }) = _ConsultaItemFilter;

  factory ConsultaItemFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaItemFilterFromJson(json);

  static ConsultaItemFilter copy(ConsultaItemFilter obj) {
    return ConsultaItemFilter.fromJson(obj.toJson());
  }

  factory ConsultaItemFilter.empty() => ConsultaItemFilter(
        codItem: null,
        codGrupo: null,
        codItemDescritor: null,
        codProprietario: null,
        codSituacao: null,
        codKit: null,
        numeroPatrimonio: null,
        descricaoCurtaItem: null,
        cmInicio: null,
        cmTermino: null,
        considerarRepositorio: null,
        repositorio: null,
        descarte: null,
        rotulado: null,
        implantavel: null,
        codBarraKitContem: null,
        idEtiquetaContem: null,
      );
}
