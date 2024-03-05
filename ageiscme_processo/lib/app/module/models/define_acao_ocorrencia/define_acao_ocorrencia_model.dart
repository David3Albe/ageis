import 'package:ageiscme_processo/app/module/enums/tipo_material_acao_ocorrencia.dart';
import 'package:ageiscme_processo/app/module/enums/tipo_motivo_ocorrencias.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'define_acao_ocorrencia_model.g.dart';
part 'define_acao_ocorrencia_model.freezed.dart';

@unfreezed
sealed class DefineAcaoOcorrenciaModel with _$DefineAcaoOcorrenciaModel {
  const DefineAcaoOcorrenciaModel._();

  factory DefineAcaoOcorrenciaModel({
    required int? codMaterial,
    required TipoMaterialAcaoOcorrencia? tipoMaterial,
    required TipoMotivoOcorrencias? tipoMotivo,
    required int? codMotivo,
  }) = _DefineAcaoOcorrenciaModel;

  factory DefineAcaoOcorrenciaModel.fromJson(Map<String, Object?> json) =>
      _$DefineAcaoOcorrenciaModelFromJson(json);
}
