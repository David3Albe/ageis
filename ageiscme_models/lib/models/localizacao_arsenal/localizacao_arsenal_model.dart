import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'localizacao_arsenal_model.freezed.dart';
part 'localizacao_arsenal_model.g.dart';

@unfreezed
abstract class LocalizacaoArsenalModel
    with
        _$LocalizacaoArsenalModel,
        DropDownFilterMixin<LocalizacaoArsenalModel> {
  const LocalizacaoArsenalModel._();

  factory LocalizacaoArsenalModel({
    required int? cod,
    required String? local,
    required int? codEstoque,
    required int? codBarra,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required ArsenalEstoqueModel? arsenal,
  }) = _LocalizacaoArsenalModel;

  factory LocalizacaoArsenalModel.fromJson(Map<String, Object?> json) =>
      _$LocalizacaoArsenalModelFromJson(json);

  static LocalizacaoArsenalModel copy(
          LocalizacaoArsenalModel localizacaoArsenal) =>
      LocalizacaoArsenalModel.fromJson(localizacaoArsenal.toJson());

  factory LocalizacaoArsenalModel.empty() => LocalizacaoArsenalModel(
        cod: 0,
        local: '',
        codEstoque: 0,
        codBarra: null,
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
        arsenal: null,
      );

  List<DropDownFilterModel<LocalizacaoArsenalModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) =>
              object.local != null &&
              object.local!.toUpperCase().endsWith(filter.toUpperCase()),
        ),
        DropDownFilterModel(
          (object) =>
              object.local == null ||
              object.local!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String ArsenalEstoqueLocalText() => '${local == null ? '' : local!}';
}
