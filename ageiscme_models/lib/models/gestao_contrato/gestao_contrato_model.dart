import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'gestao_contrato_model.freezed.dart';
part 'gestao_contrato_model.g.dart';

@unfreezed
abstract class GestaoContratoModel with _$GestaoContratoModel {
  factory GestaoContratoModel({
    required int? cod,
    required String? descricao,
    required String? link,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _GestaoContratoModel;

  factory GestaoContratoModel.fromJson(Map<String, Object?> json) =>
      _$GestaoContratoModelFromJson(json);

  static GestaoContratoModel copy(GestaoContratoModel gestaoContrato) =>
      GestaoContratoModel.fromJson(gestaoContrato.toJson());

  factory GestaoContratoModel.empty() => GestaoContratoModel(
        cod: 0,
        descricao: '',
        link: '',
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
      );
}
