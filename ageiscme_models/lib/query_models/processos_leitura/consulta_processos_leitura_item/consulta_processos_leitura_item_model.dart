import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_item_model.g.dart';
part 'consulta_processos_leitura_item_model.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraItemModel
    with _$ConsultaProcessosLeituraItemModel {
  const ConsultaProcessosLeituraItemModel._();

  factory ConsultaProcessosLeituraItemModel({
     required int cod,
         required String idEtiqueta,
         required String descricao,
         int? qtdeProcessos,
         int? codProprietario,
  }) = _ConsultaProcessosLeituraItemModel;

  factory ConsultaProcessosLeituraItemModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraItemModelFromJson(json);

  static ConsultaProcessosLeituraItemModel copy(
      ConsultaProcessosLeituraItemModel obj) {
    return ConsultaProcessosLeituraItemModel.fromJson(obj.toJson());
  }
}
