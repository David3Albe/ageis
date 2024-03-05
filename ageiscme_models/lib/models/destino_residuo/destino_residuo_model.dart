import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'destino_residuo_model.freezed.dart';
part 'destino_residuo_model.g.dart';

@unfreezed
abstract class DestinoResiduoModel
    with
        _$DestinoResiduoModel,
        DropDownText,
        DropDownFilterMixin<DestinoResiduoModel> {
  const DestinoResiduoModel._();

  factory DestinoResiduoModel({
    required int? cod,
    required String? nome,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _DestinoResiduoModel;

  factory DestinoResiduoModel.fromJson(Map<String, Object?> json) =>
      _$DestinoResiduoModelFromJson(json);

  static DestinoResiduoModel copy(DestinoResiduoModel destinoResiduo) =>
      DestinoResiduoModel.fromJson(destinoResiduo.toJson());

  factory DestinoResiduoModel.empty() => DestinoResiduoModel(
        cod: 0,
        nome: '',
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => nome == null ? '' : nome!;

  List<DropDownFilterModel<DestinoResiduoModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) =>
              object.nome != null &&
              object.nome!.toUpperCase().endsWith(filter.toUpperCase()),
        ),
        DropDownFilterModel(
          (object) =>
              object.nome == null ||
              object.nome!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String GetNomeDestinoText() => '${nome == null ? '' : nome!}';
}
