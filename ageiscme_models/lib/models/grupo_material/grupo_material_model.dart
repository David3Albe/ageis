import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'grupo_material_model.freezed.dart';
part 'grupo_material_model.g.dart';

@unfreezed
abstract class GrupoMaterialModel
    with
        _$GrupoMaterialModel,
        DropDownText,
        DropDownFilterMixin<GrupoMaterialModel> {
  const GrupoMaterialModel._();

  factory GrupoMaterialModel({
    required int? cod,
    required String? nome,
    required String? descricao,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _GrupoMaterialModel;

  factory GrupoMaterialModel.fromJson(Map<String, Object?> json) =>
      _$GrupoMaterialModelFromJson(json);

  static GrupoMaterialModel copy(GrupoMaterialModel grupoMaterial) {
    return GrupoMaterialModel.fromJson(grupoMaterial.toJson());
  }

  factory GrupoMaterialModel.empty() => GrupoMaterialModel(
        cod: 0,
        nome: '',
        descricao: '',
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => nome == null ? '' : nome!;

  List<DropDownFilterModel<GrupoMaterialModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) =>
              object.cod != null && object.cod.toString().endsWith(filter),
        ),
        DropDownFilterModel(
          (object) =>
              object.nome == null ||
              object.nome!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String GetGrupoNomeText() => '($cod) ${nome == null ? '' : nome!}';
}
