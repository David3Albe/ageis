import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_anormalidade_materiais_model.g.dart';
part 'consulta_anormalidade_materiais_model.freezed.dart';

@unfreezed
sealed class ConsultaAnormalidadeMateriaisModel
    with _$ConsultaAnormalidadeMateriaisModel {
  const ConsultaAnormalidadeMateriaisModel._();

  factory ConsultaAnormalidadeMateriaisModel({
    DateTime? dataHora,
    int? codKit,
    String? nomeKi,
    int? codItem,
    String? idEtiqueta,
    String? nomeItem,
    int? codRegistroProcesso,
    String? destino,
    String? entradaSaida,
    String? etapa,
    String? statusItem,
    String? statusKit,
  }) = _ConsultaAnormalidadeMateriaisModel;

  factory ConsultaAnormalidadeMateriaisModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaAnormalidadeMateriaisModelFromJson(json);

  static ConsultaAnormalidadeMateriaisModel copy(
      ConsultaAnormalidadeMateriaisModel obj) {
    return ConsultaAnormalidadeMateriaisModel.fromJson(obj.toJson());
  }
}
