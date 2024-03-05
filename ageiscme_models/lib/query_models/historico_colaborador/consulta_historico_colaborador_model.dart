import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_historico_colaborador_model.g.dart';
part 'consulta_historico_colaborador_model.freezed.dart';

@unfreezed
sealed class ConsultaHistoricoColaboradorModel
    with _$ConsultaHistoricoColaboradorModel {
  const ConsultaHistoricoColaboradorModel._();

  factory ConsultaHistoricoColaboradorModel({
    required DateTime? dataHora,
    required int? cod,
    required String? colaborador,
    required String? tipo,
    required String? descricao,
    required String? detalhe,
  }) = _ConsultaHistoricoColaboradorModel;

  factory ConsultaHistoricoColaboradorModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaHistoricoColaboradorModelFromJson(json);

  static ConsultaHistoricoColaboradorModel copy(
      ConsultaHistoricoColaboradorModel obj) {
    return ConsultaHistoricoColaboradorModel.fromJson(obj.toJson());
  }
}
