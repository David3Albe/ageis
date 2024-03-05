import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'tipo_documento_model.freezed.dart';
part 'tipo_documento_model.g.dart';

@unfreezed
abstract class TipoDocumentoModel
    with
        _$TipoDocumentoModel,
        DropDownText,
        DropDownFilterMixin<TipoDocumentoModel> {
  const TipoDocumentoModel._();

  factory TipoDocumentoModel({
    required int? cod,
    required String? descricao,
  }) = _TipoDocumentoModel;

  factory TipoDocumentoModel.fromJson(Map<String, Object?> json) =>
      _$TipoDocumentoModelFromJson(json);

  static TipoDocumentoModel copy(TipoDocumentoModel tipoDocumento) {
    return TipoDocumentoModel.fromJson(tipoDocumento.toJson());
  }

  factory TipoDocumentoModel.empty() => TipoDocumentoModel(
        cod: 0,
        descricao: '',
      );

  String GetDropDownText() => descricao == null ? '' : descricao!;

  List<DropDownFilterModel<TipoDocumentoModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) =>
              object.descricao != null &&
              object.descricao!.toUpperCase().endsWith(filter.toUpperCase()),
        ),
        DropDownFilterModel(
          (object) =>
              object.descricao == null ||
              object.descricao!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String GetNomeDepositoText() =>
      '($cod) ${descricao == null ? '' : descricao!}';
}
