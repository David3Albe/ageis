import 'package:ageiscme_models/models/servico_tipo/servico_tipo_model.dart';
import 'package:ageiscme_models/response_dto/equipamento/drop_down_search/equipamento_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/item/drop_down_search/item_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'registro_servico_search_dto_response_dto.freezed.dart';
part 'registro_servico_search_dto_response_dto.g.dart';

@unfreezed
sealed class RegistroServicoSearchResponseDTO with _$RegistroServicoSearchResponseDTO {
  const RegistroServicoSearchResponseDTO._();
  factory RegistroServicoSearchResponseDTO({
    int? cod,
    String? indicador,
    String? resultado,
    String? descricao,
    String? restricao,
    String? usuarioRegistro,
    String? lote,
    String? tecnico,
    String? imagemDocAnexo,
    String? motivoLiberacao,
    DateTime? dataEnvio,
    DateTime? dataRetorno,
    DateTime? dataInicio,
    DateTime? dataTermino,
    DateTime? dataValidade,
    DateTime? dataLiberacao,
    DateTime? dataRegistro,
    int? codUsuario,
    int? codEquipamento,
    int? codItem,
    int? codEstoque,
    int? codUsuarioLiberado,
    int? codServicosTipos,
    int? codInstituicao,
    double? temperatura,
    double? umidade,
    double? temperaturaMax,
    double? temperaturaMin,
    double? umidadeMax,
    double? umidadeMin,
    bool? controlarValidade,
    DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') String? tstamp,
    EquipamentoDropDownSearchResponseDTO? equipamento,
    ItemDropDownSearchResponseDTO? item,
    ServicoTipoModel? servicoTipo,
    UsuarioDropDownSearchResponseDTO? usuario,
    UsuarioDropDownSearchResponseDTO? usuarioDropDown,
    UsuarioDropDownSearchResponseDTO? usuarioTecnico,
  }) = _RegistroServicoSearchResponseDTO;

  factory RegistroServicoSearchResponseDTO.fromJson(Map<String, Object?> json) =>
      _$RegistroServicoSearchResponseDTOFromJson(json);

  static RegistroServicoSearchResponseDTO copy(RegistroServicoSearchResponseDTO registroServico) =>
      RegistroServicoSearchResponseDTO.fromJson(registroServico.toJson());
}