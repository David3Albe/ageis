import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'fornecedor_model.freezed.dart';
part 'fornecedor_model.g.dart';

@unfreezed
abstract class FornecedorModel with _$FornecedorModel, DropDownText {
  const FornecedorModel._();

  factory FornecedorModel({
    required int? cod,
    required String? nome,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _FornecedorModel;

  factory FornecedorModel.fromJson(Map<String, Object?> json) =>
      _$FornecedorModelFromJson(json);

  static FornecedorModel copy(FornecedorModel fornecedor) {
    return FornecedorModel.fromJson(fornecedor.toJson());
  }

  factory FornecedorModel.empty() => FornecedorModel(
        cod: 0,
        nome: '',
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => nome == null ? '' : nome!;
}
