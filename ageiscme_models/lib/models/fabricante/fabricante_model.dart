import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'fabricante_model.freezed.dart';
part 'fabricante_model.g.dart';

@unfreezed
abstract class FabricanteModel with _$FabricanteModel, DropDownText {
  const FabricanteModel._();

  factory FabricanteModel({
    required int? cod,
    required String? nome,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _FabricanteModel;

  factory FabricanteModel.fromJson(Map<String, Object?> json) =>
      _$FabricanteModelFromJson(json);

  static FabricanteModel copy(FabricanteModel fabricante) {
    return FabricanteModel.fromJson(fabricante.toJson());
  }

  factory FabricanteModel.empty() => FabricanteModel(
        cod: 0,
        nome: '',
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => nome == null ? '' : nome!;
}
