import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'data_matrix_geral_leitura_model.freezed.dart';
part 'data_matrix_geral_leitura_model.g.dart';

@unfreezed
abstract class DataMatrixGeralLeituraModel with _$DataMatrixGeralLeituraModel {
  const DataMatrixGeralLeituraModel._();
  factory DataMatrixGeralLeituraModel({
    int? codUsuarioLiberacao,
    int? codKit,
  }) = _DataMatrixGeralLeituraModel;

  factory DataMatrixGeralLeituraModel.fromJson(Map<String, Object?> json) =>
      _$DataMatrixGeralLeituraModelFromJson(json);
}
