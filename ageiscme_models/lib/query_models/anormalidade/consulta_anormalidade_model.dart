import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_anormalidade_model.g.dart';
part 'consulta_anormalidade_model.freezed.dart';

@unfreezed
sealed class ConsultaAnormalidadeModel
    with _$ConsultaAnormalidadeModel {
  const ConsultaAnormalidadeModel._();

  factory ConsultaAnormalidadeModel({
    DateTime? dataHora,
    int? codItem,
    String? idEtiqueta,
    String? nomeItem,
    String? tipoAnormalidadeNome,
    int? codAnormalidadeTipo,
    int? codRegistroProcesso,
    int? cod,
    String? etapaProcessoNome,
    int? etapaProcessoCod,
    String? nomeUsuario,
    DateTime? dataHoraLiberacao,
    String? observacao,
    String? observacaoLiberacao,
    String? nomeUsuarioLiberacao,
  }) = _ConsultaAnormalidadeModel;

  factory ConsultaAnormalidadeModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaAnormalidadeModelFromJson(json);

  static ConsultaAnormalidadeModel copy(
      ConsultaAnormalidadeModel obj) {
    return ConsultaAnormalidadeModel.fromJson(obj.toJson());
  }
}
