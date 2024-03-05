import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'unidade_medida_model.freezed.dart';
part 'unidade_medida_model.g.dart';

@unfreezed
abstract class UnidadeMedidaModel with _$UnidadeMedidaModel, DropDownText {
  const UnidadeMedidaModel._();

  factory UnidadeMedidaModel({
    required int? cod,
    required String? nome,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') String? tstamp,
  }) = _UnidadeMedidaModel;

  factory UnidadeMedidaModel.fromJson(Map<String, Object?> json) =>
      _$UnidadeMedidaModelFromJson(json);

  static UnidadeMedidaModel copy(UnidadeMedidaModel unidadeMedida) {
    return UnidadeMedidaModel.fromJson(unidadeMedida.toJson());
  }

  factory UnidadeMedidaModel.empty() => UnidadeMedidaModel(
        cod: 0,
        nome: '',
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => nome == null ? '' : nome!;
}
