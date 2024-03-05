import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_item_filter.g.dart';
part 'consulta_item_filter.freezed.dart';

@unfreezed
sealed class ConsultaItemFilter with _$ConsultaItemFilter {
  const ConsultaItemFilter._();

  factory ConsultaItemFilter({
    required int? codItemDescritor,
    required int? codItem,
    required String? codSituacao,
    required int? codGrupo,
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
    ItemModel? item,
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
      );
}
