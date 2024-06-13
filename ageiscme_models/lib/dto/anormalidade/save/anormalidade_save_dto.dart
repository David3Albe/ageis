import 'package:ageiscme_models/models/processo_etapa/processo_etapa_model.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/short/anormalidade_tipo_short_response_dto.dart';
import 'package:ageiscme_models/response_dto/item/drop_down_search/item_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/processo_registro/ultimo/processo_registro_ultimo_response_dto.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_save_dto.g.dart';
part 'anormalidade_save_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeSaveDTO with _$AnormalidadeSaveDTO {
  factory AnormalidadeSaveDTO({
    required int cod,
    DateTime? dataHora,
    String? descricao,
    int? codUsuario,
    int? codAnormalidadeTipo,
    int? codInstituicao,
    DateTime? ultimaAlteracao,
    String? tstamp,
    int? codItem,
    int? codRegistroProcesso,
    int? codUsuarioLiberacao,
    String? observacaoLiberacao,
    DateTime? dataLiberacao,
    int? codProcessoEtapa,
    ProcessoRegistroUltimoResponseDTO? processoRegistro,
    ItemDropDownSearchResponseDTO? item,
    ProcessoEtapaModel? etapa,
    AnormalidadeTipoShortResponseDTO? anormalidadeTipo,
    UsuarioDropDownSearchResponseDTO? usuario,
    UsuarioDropDownSearchResponseDTO? usuarioLiberacao,
  }) = _AnormalidadeSaveDTO;

  factory AnormalidadeSaveDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeSaveDTOFromJson(json);

  factory AnormalidadeSaveDTO.empty() => AnormalidadeSaveDTO(
        cod: 0,
      );
}
