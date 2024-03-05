import 'package:freezed_annotation/freezed_annotation.dart';

part 'equipamento_servico_model.g.dart';
part 'equipamento_servico_model.freezed.dart';

@unfreezed
abstract class EquipamentoServicoModel with _$EquipamentoServicoModel {
  factory EquipamentoServicoModel({
    required int? cod,
    required int? codInstituicao,
    required int? codEquipamento,
    required int? codServico,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _EquipamentoServicoModel;

  factory EquipamentoServicoModel.fromJson(Map<String, Object?> json) =>
      _$EquipamentoServicoModelFromJson(json);

  static EquipamentoServicoModel copy(
          EquipamentoServicoModel equipamentoServico) =>
      EquipamentoServicoModel.fromJson(equipamentoServico.toJson());

  factory EquipamentoServicoModel.empty() => EquipamentoServicoModel(
        cod: 0,
        codEquipamento: 0,
        codInstituicao: 0,
        codServico: 0,
        ultimaAlteracao: null,
        tstamp: '',
      );
}
