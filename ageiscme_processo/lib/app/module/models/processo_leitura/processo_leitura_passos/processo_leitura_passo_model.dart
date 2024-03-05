import 'package:ageiscme_processo/app/module/enums/tipo_passo.dart';
import 'package:compartilhados/componentes/stepper/custom_stepper_step_mixin.dart';
import 'package:compartilhados/componentes/stepper/custom_stepper_step_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_passo_model.g.dart';
part 'processo_leitura_passo_model.freezed.dart';

@unfreezed
sealed class ProcessoLeituraPassoModel
    with _$ProcessoLeituraPassoModel, CustomStepperStepMixin {
  ProcessoLeituraPassoModel._();

  factory ProcessoLeituraPassoModel({
    required int tipoPasso,
    required String descricao,
    required int situacao,
    required int ordem,
  }) = _ProcessoLeituraPassoModel;

  factory ProcessoLeituraPassoModel.fromJson(Map<String, Object?> json) =>
      _$ProcessoLeituraPassoModelFromJson(json);

  static ProcessoLeituraPassoModel copy(
    ProcessoLeituraPassoModel processoLeituraPasso,
  ) =>
      ProcessoLeituraPassoModel.fromJson(processoLeituraPasso.toJson());

  static List<ProcessoLeituraPassoModel> getDefaultSteps() => [
        ProcessoLeituraPassoModel(
          tipoPasso: TipoPassoValue.getValue(TipoPasso.Usuario),
          descricao: 'Identificar Usuário',
          situacao: CustomStepperStepStatusValue.getValue(
            CustomStepperStepStatus.Andamento,
          ),
          ordem: 1,
        ),
        ProcessoLeituraPassoModel(
          tipoPasso: TipoPassoValue.getValue(TipoPasso.Local),
          descricao: 'Definir Local',
          situacao: CustomStepperStepStatusValue.getValue(
            CustomStepperStepStatus.Aberto,
          ),
          ordem: 2,
        ),
        ProcessoLeituraPassoModel(
          tipoPasso: TipoPassoValue.getValue(TipoPasso.Acao),
          descricao: 'Definir Ação',
          situacao: CustomStepperStepStatusValue.getValue(
            CustomStepperStepStatus.Aberto,
          ),
          ordem: 3,
        ),
        ProcessoLeituraPassoModel(
          tipoPasso: TipoPassoValue.getValue(TipoPasso.Item),
          descricao: 'Identificar Item',
          situacao: CustomStepperStepStatusValue.getValue(
            CustomStepperStepStatus.Aberto,
          ),
          ordem: 4,
        ),
        ProcessoLeituraPassoModel(
          tipoPasso: TipoPassoValue.getValue(TipoPasso.Finalizar),
          descricao: 'Finalizar',
          situacao: CustomStepperStepStatusValue.getValue(
            CustomStepperStepStatus.Aberto,
          ),
          ordem: 5,
        ),
      ];
}
