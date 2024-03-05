import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'consulta_registro_servico_model.g.dart';
part 'consulta_registro_servico_model.freezed.dart';

@unfreezed
sealed class ConsultaRegistroServicoModel with _$ConsultaRegistroServicoModel {
  const ConsultaRegistroServicoModel._();

  factory ConsultaRegistroServicoModel({
    required DateTime? dataInicio,
    required DateTime? dataTermino,
    required DateTime? dataValidade,
    required int? cod,
    required String? lote,
    required String? descricao,
    required double? temperatura,
    required double? umidade,
    required double? temperaturaMax,
    required double? temperaturaMin,
    required double? umidadeMax,
    required double? umidadeMin,
    required String? resultado,
    required String? usuarioRegistro,
    required String? indicador,
    required String? nomeItem,
    required EquipamentoModel? equipamento,
    required RegistroServicoModel? registroServico,
    required ItemModel? item,
    required ServicoTipoModel? servicoTipo,
    required UsuarioModel? usuario,
  }) = _ConsultaRegistroServicoModel;

  factory ConsultaRegistroServicoModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaRegistroServicoModelFromJson(json);

  static ConsultaRegistroServicoModel copy(ConsultaRegistroServicoModel obj) {
    return ConsultaRegistroServicoModel.fromJson(obj.toJson());
  }
}
