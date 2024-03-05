import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_item_etiqueta_model.g.dart';
part 'consulta_item_etiqueta_model.freezed.dart';

@unfreezed
sealed class ConsultaItemEtiquetaModel with _$ConsultaItemEtiquetaModel {
  const ConsultaItemEtiquetaModel._();

  factory ConsultaItemEtiquetaModel({
    required int? codItem,
    required String? idEtiqueta,
    required String? descricao,
    required String? nomeProprietario,
    required int? codKit,
    required String? nomeKit,
    required int? totalEtiquetas,
    required int? totalProcessos,
    required String? idEtiquetaItensEtiqueta,
    required int? qtdeProcessos,
    required DateTime? dataDescarte,
    required String? usuarioAlteracaoEtiqueta,
    required int? durabDias,
  }) = _ConsultaItemEtiquetaModel;

  factory ConsultaItemEtiquetaModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaItemEtiquetaModelFromJson(json);

  static ConsultaItemEtiquetaModel copy(ConsultaItemEtiquetaModel obj) {
    return ConsultaItemEtiquetaModel.fromJson(obj.toJson());
  }
}
