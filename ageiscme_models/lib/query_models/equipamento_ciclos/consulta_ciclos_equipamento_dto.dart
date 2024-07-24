import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_ciclos_equipamento_dto.g.dart';
part 'consulta_ciclos_equipamento_dto.freezed.dart';

@unfreezed
sealed class ConsultaCiclosEquipamentoDTO with _$ConsultaCiclosEquipamentoDTO {
  const ConsultaCiclosEquipamentoDTO._();

  factory ConsultaCiclosEquipamentoDTO({
    bool? imprimir,
    DateTime? dataHora,
    String? nomeEquipamento,
    String? nomeProcesso,
    String? indicador,
    String? idEtiqueta,
    String? nomeItem,
    int? codKit,
    String? codBarraKit,
    String? nomeKit,
    String? nomeProprietario,
    String? lote,
    String? loteEquipamento,
    String? nomeUsuario,
  }) = _ConsultaCiclosEquipamentoDTO;

  factory ConsultaCiclosEquipamentoDTO.fromJson(Map<String, Object?> json) =>
      _$ConsultaCiclosEquipamentoDTOFromJson(json);

  static ConsultaCiclosEquipamentoDTO copy(ConsultaCiclosEquipamentoDTO obj) {
    return ConsultaCiclosEquipamentoDTO.fromJson(obj.toJson());
  }
}
