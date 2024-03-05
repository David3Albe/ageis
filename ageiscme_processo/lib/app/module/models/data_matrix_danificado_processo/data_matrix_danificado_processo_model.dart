import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_matrix_danificado_processo_model.freezed.dart';
part 'data_matrix_danificado_processo_model.g.dart';

@unfreezed
abstract class DataMatrixDanificadoProcessoModel
    with _$DataMatrixDanificadoProcessoModel {
  const DataMatrixDanificadoProcessoModel._();
  factory DataMatrixDanificadoProcessoModel({
    bool? identificadoEmLeituraAtual,
    bool? dataMatrixAlteradoPreparo,
  }) = _DataMatrixDanificadoProcessoModel;

  factory DataMatrixDanificadoProcessoModel.fromJson(
    Map<String, Object?> json,
  ) =>
      _$DataMatrixDanificadoProcessoModelFromJson(json);
}
