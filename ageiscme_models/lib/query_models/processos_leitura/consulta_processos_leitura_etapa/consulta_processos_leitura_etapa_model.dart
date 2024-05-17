import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_etapa_model.g.dart';
part 'consulta_processos_leitura_etapa_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraEtapaModel
    with _$ConsultaProcessosLeituraEtapaModel {
  const ConsultaProcessosLeituraEtapaModel._();

  factory ConsultaProcessosLeituraEtapaModel({
    required int cod,
    String? nome,
    int? codEquipamento,
    int? codTipoProcesso,
    bool? imprimirEtiquetaLote,
  }) = _ConsultaProcessosLeituraEtapaModel;

  factory ConsultaProcessosLeituraEtapaModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraEtapaModelFromJson(json);

  static ConsultaProcessosLeituraEtapaModel copy(
      ConsultaProcessosLeituraEtapaModel obj) {
    return ConsultaProcessosLeituraEtapaModel.fromJson(obj.toJson());
  }
}
