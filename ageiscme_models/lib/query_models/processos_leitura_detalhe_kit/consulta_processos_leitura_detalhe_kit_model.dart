import 'package:ageiscme_models/query_models/processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_item/consulta_processos_leitura_detalhe_kit_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_detalhe_kit_model.g.dart';
part 'consulta_processos_leitura_detalhe_kit_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraDetalheKitModel
    with _$ConsultaProcessosLeituraDetalheKitModel {
  const ConsultaProcessosLeituraDetalheKitModel._();

  factory ConsultaProcessosLeituraDetalheKitModel({
    String? legenda,
        String? statusKit,
        required List<ConsultaProcessosLeituraDetalheKitItemModel> itens,
  }) = _ConsultaProcessosLeituraDetalheKitModel;

  factory ConsultaProcessosLeituraDetalheKitModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraDetalheKitModelFromJson(json);

  static ConsultaProcessosLeituraDetalheKitModel copy(
      ConsultaProcessosLeituraDetalheKitModel obj) {
    return ConsultaProcessosLeituraDetalheKitModel.fromJson(obj.toJson());
  }
}
