import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_detalhe_kit_model.g.dart';
part 'consulta_processos_leitura_detalhe_kit_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraDetalheKitModel
    with _$ConsultaProcessosLeituraDetalheKitModel {
  const ConsultaProcessosLeituraDetalheKitModel._();

  factory ConsultaProcessosLeituraDetalheKitModel({
    required String? idEtiqueta,
    required String? descricaoCurta,
    required String? descritor,
    required String? situacao,
    required String? responsavel,
    required DateTime? dataHora,
    required String? tamanho,
    required String? grupo,
    required String? proprietario,
    required String? implantavel,
    required DateTime? dataDescarte,
    required String? restricao,
    required String? statusCod,
    required int? cod,
    required int? codKit,
    required int? codRegistroProcesso,
  }) = _ConsultaProcessosLeituraDetalheKitModel;

  factory ConsultaProcessosLeituraDetalheKitModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraDetalheKitModelFromJson(json);

  static ConsultaProcessosLeituraDetalheKitModel copy(
      ConsultaProcessosLeituraDetalheKitModel obj) {
    return ConsultaProcessosLeituraDetalheKitModel.fromJson(obj.toJson());
  }
}
