import 'package:ageiscme_models/mixins/local_mixin.dart';
import 'package:ageiscme_models/models/equipamento_servico/equipamento_servico_model.dart';
import 'package:ageiscme_models/models/processo_etapa/processo_etapa_model.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_model.freezed.dart';
part 'equipamento_model.g.dart';

@unfreezed
abstract class EquipamentoModel
    with
        _$EquipamentoModel,
        DropDownText,
        DropDownFilterMixin<EquipamentoModel>,
        LocalMixin {
  EquipamentoModel._();

  static const String STATUS_BLOQUEADO = '0';
  static const String STATUS_LIBERADO = '1';
  static const String STATUS_LIBERADO_COM_RESTRICOES = '2';

  factory EquipamentoModel({
    required int? cod,
    required String? nome,
    required String? fabricante,
    required String? serie,
    required String? registroAnvisa,
    required String? codBarra,
    required String? status,
    required DateTime? validadeInspecao,
    required int? anoFabricacao,
    required int? capacidadeLitro,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    List<EquipamentoServicoModel>? equipamentosServicos,
    required List<ProcessoEtapaModel>? etapas,
  }) = _EquipamentoModel;

  factory EquipamentoModel.fromJson(Map<String, Object?> json) =>
      _$EquipamentoModelFromJson(json);

  static EquipamentoModel copy(EquipamentoModel equipamento) =>
      EquipamentoModel.fromJson(equipamento.toJson());

  factory EquipamentoModel.empty() => EquipamentoModel(
        cod: 0,
        nome: '',
        fabricante: '',
        serie: '',
        registroAnvisa: '',
        codBarra: '',
        status: '0',
        validadeInspecao: null,
        anoFabricacao: 0,
        capacidadeLitro: null,
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
        equipamentosServicos: [],
        etapas: null,
      );

  String GetDropDownText() => nome == null ? '' : nome!;

  List<DropDownFilterModel<EquipamentoModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) =>
              object.nome != null &&
              object.nome!.toUpperCase().endsWith(filter.toUpperCase()),
        ),
        DropDownFilterModel(
          (object) =>
              object.nome == null ||
              object.nome!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String EquipamentoNomeText() => '($cod) ${nome == null ? '' : nome!}';
}
