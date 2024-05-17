import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura/consulta_processos_leitura_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_embalagem/consulta_processos_leitura_embalagem_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_equipamento/consulta_processos_leitura_equipamento_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_etapa/consulta_processos_leitura_etapa_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_item/consulta_processos_leitura_item_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_kit/consulta_processos_leitura_kit_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_local/consulta_processos_leitura_local_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_motivo/consulta_processos_leitura_motivo_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_motivo_quebra_fluxo/consulta_processos_leitura_motivo_quebra_fluxo_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_prioridade/consulta_processos_leitura_prioridade_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_proprietario/consulta_processos_leitura_proprietario_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_tipo_processo/consulta_processos_leitura_tipo_processo_model.dart';
import 'package:ageiscme_models/query_models/processos_leitura/consulta_processos_leitura_usuario/consulta_processos_leitura_usuario_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_response_model.g.dart';
part 'consulta_processos_leitura_response_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraResponseModel
    with _$ConsultaProcessosLeituraResponseModel {
  const ConsultaProcessosLeituraResponseModel._();

  factory ConsultaProcessosLeituraResponseModel({
    required List<ConsultaProcessosLeituraModel> leituras,
    required Map<int, ConsultaProcessosLeituraKitModel> kits,
    required Map<int, ConsultaProcessosLeituraPrioridadeModel> prioridades,
    required Map<int, ConsultaProcessosLeituraTipoProcessoModel> tiposProcesso,
    required Map<int, ConsultaProcessosLeituraUsuarioModel> usuarios,
    required Map<int, ConsultaProcessosLeituraItemModel> items,
    required Map<int, ConsultaProcessosLeituraProprietarioModel> proprietarios,
    required Map<int, ConsultaProcessosLeituraEtapaModel> etapas,
    required Map<int, ConsultaProcessosLeituraLocalModel> locais,
    required Map<int, ConsultaProcessosLeituraEmbalagemModel> embalagens,
    required Map<int, ConsultaProcessosLeituraMotivoModel> motivos,
    required Map<int, ConsultaProcessosLeituraMotivoQuebraFluxoModel>
        motivosQuebraFluxo,
    required Map<int, ConsultaProcessosLeituraEquipamentoModel> equipamentos,
  }) = _ConsultaProcessosLeituraResponseModel;

  factory ConsultaProcessosLeituraResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraResponseModelFromJson(json);

  static ConsultaProcessosLeituraResponseModel copy(
      ConsultaProcessosLeituraResponseModel obj) {
    return ConsultaProcessosLeituraResponseModel.fromJson(obj.toJson());
  }
}
