import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_consignado_model.g.dart';
part 'consulta_processos_consignado_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosConsignadoModel
    with _$ConsultaProcessosConsignadoModel {
  const ConsultaProcessosConsignadoModel._();

  factory ConsultaProcessosConsignadoModel({
    required DateTime? dataHora,
    required String? usuario,
    required String? origem,
    required String? circulante,
    required String? prontuario,
    required String? idEtiqueta,
    required String? materialConsignado,
    required String? nomeProprietario,
    required int? codItemConsignado,
    required String? descricaoItemConsignado,
    required int? qtdePadrao,
    required int? recebido,
    required int? consumido,
    required int? codRegistroProcessoExpurgo,
    required int? codItem,
    required String? medico,
    required String? entreguePor,
    required String? retiradoPor,
    required bool? imprimir,
  }) = _ConsultaProcessosConsignadoModel;

  factory ConsultaProcessosConsignadoModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosConsignadoModelFromJson(json);

  static ConsultaProcessosConsignadoModel copy(
      ConsultaProcessosConsignadoModel obj) {
    return ConsultaProcessosConsignadoModel.fromJson(obj.toJson());
  }
}
