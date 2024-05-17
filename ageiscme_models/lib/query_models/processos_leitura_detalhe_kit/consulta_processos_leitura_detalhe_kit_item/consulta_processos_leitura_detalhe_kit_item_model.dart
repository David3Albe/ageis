import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_detalhe_kit_item_model.g.dart';
part 'consulta_processos_leitura_detalhe_kit_item_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraDetalheKitItemModel
    with _$ConsultaProcessosLeituraDetalheKitItemModel {
  const ConsultaProcessosLeituraDetalheKitItemModel._();

  factory ConsultaProcessosLeituraDetalheKitItemModel({
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
  }) = _ConsultaProcessosLeituraDetalheKitItemModel;

  factory ConsultaProcessosLeituraDetalheKitItemModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraDetalheKitItemModelFromJson(json);

  static ConsultaProcessosLeituraDetalheKitItemModel copy(
      ConsultaProcessosLeituraDetalheKitItemModel obj) {
    return ConsultaProcessosLeituraDetalheKitItemModel.fromJson(obj.toJson());
  }
}
