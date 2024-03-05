import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'acao_ocorrencia_model.freezed.dart';
part 'acao_ocorrencia_model.g.dart';

@unfreezed
abstract class AcaoOcorrenciaModel
    with _$AcaoOcorrenciaModel, DropDownFilterMixin<AcaoOcorrenciaModel> {
  const AcaoOcorrenciaModel._();

  factory AcaoOcorrenciaModel({
    required int? cod,
    required String? descricao,
    required int? codInstituicao,
    required bool? acaoCorretiva,
    required bool? motivoNaoCorrecao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _AcaoOcorrenciaModel;

  factory AcaoOcorrenciaModel.fromJson(Map<String, Object?> json) =>
      _$AcaoOcorrenciaModelFromJson(json);

  static AcaoOcorrenciaModel copy(AcaoOcorrenciaModel acaoOcorrencia) =>
      AcaoOcorrenciaModel.fromJson(acaoOcorrencia.toJson());

  factory AcaoOcorrenciaModel.empty() => AcaoOcorrenciaModel(
        cod: 0,
        descricao: '',
        codInstituicao: 0,
        ativo: true,
        acaoCorretiva: false,
        motivoNaoCorrecao: false,
        ultimaAlteracao: null,
        tstamp: '',
      );

  List<DropDownFilterModel<AcaoOcorrenciaModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) =>
              object.cod != null && object.cod.toString().endsWith(filter),
        ),
        DropDownFilterModel(
          (object) =>
              object.descricao == null ||
              object.descricao!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String AcaoOcorrenciaDescricaoText() =>
      '($cod) ${descricao == null ? '' : descricao!}';
}
