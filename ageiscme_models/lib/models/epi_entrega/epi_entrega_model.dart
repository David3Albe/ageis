import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'epi_entrega_model.freezed.dart';
part 'epi_entrega_model.g.dart';

@unfreezed
abstract class EpiEntregaModel with _$EpiEntregaModel {
  const EpiEntregaModel._();

  factory EpiEntregaModel({
    required int? cod,
    required int? codDescritorEpi,
    required int? codUsuario,
    required int? codUsuarioEntrega,
    required DateTime? dataEntrega,
    required DateTime? dataLimiteValidade,
    required DateTime? dataDescarte,
    required bool? conferenciaVisual,
    required int? codInstituicao,
    required bool? controlarValidade,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required EpiDescritorModel? epiDescritor,
  }) = _EpiEntregaModel;

  factory EpiEntregaModel.fromJson(Map<String, Object?> json) =>
      _$EpiEntregaModelFromJson(json);

  static EpiEntregaModel copy(EpiEntregaModel epiEntrega) =>
      EpiEntregaModel.fromJson(epiEntrega.toJson());

  factory EpiEntregaModel.empty() => EpiEntregaModel(
        cod: 0,
        codDescritorEpi: 0,
        codUsuario: 0,
        codInstituicao: 0,
        codUsuarioEntrega: 0,
        controlarValidade: false,
        conferenciaVisual: false,
        dataDescarte: null,
        dataEntrega: null,
        dataLimiteValidade: null,
        ultimaAlteracao: null,
        tstamp: '',
        epiDescritor: null,
      );
}
