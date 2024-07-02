import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'tipo_afastamento_model.freezed.dart';
part 'tipo_afastamento_model.g.dart';

@unfreezed
abstract class TipoAfastamentoModel with _$TipoAfastamentoModel {
  const TipoAfastamentoModel._();
  factory TipoAfastamentoModel({
    required int? cod,
    required String? motivo,
    required int? diasConcedido,
    required bool? cat,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _TipoAfastamentoModel;

  factory TipoAfastamentoModel.fromJson(Map<String, Object?> json) =>
      _$TipoAfastamentoModelFromJson(json);

  static TipoAfastamentoModel copy(TipoAfastamentoModel tipoAfastamento) =>
      TipoAfastamentoModel.fromJson(tipoAfastamento.toJson());

  String GetDropDownText() => motivo == null ? '' : motivo!;

  factory TipoAfastamentoModel.empty() => TipoAfastamentoModel(
        cod: 0,
        motivo: '',
        diasConcedido: null,
        codInstituicao: 0,
        cat: false,
        ultimaAlteracao: null,
        tstamp: '',
      );
}
