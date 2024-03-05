import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'peca_model.freezed.dart';
part 'peca_model.g.dart';

@unfreezed
abstract class PecaModel
    with _$PecaModel, DropDownText, DropDownFilterMixin<PecaModel> {
  const PecaModel._();

  factory PecaModel({
    required int? cod,
    required String? peca,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _PecaModel;

  factory PecaModel.fromJson(Map<String, Object?> json) =>
      _$PecaModelFromJson(json);

  static PecaModel copy(PecaModel peca) {
    return PecaModel.fromJson(peca.toJson());
  }

  factory PecaModel.empty() => PecaModel(
        cod: 0,
        peca: '',
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => peca == null ? '' : peca!;

  List<DropDownFilterModel<PecaModel>> GetDropDownFilters(String filter) => [
        DropDownFilterModel(
          (object) =>
              object.peca != null &&
              object.peca!.toUpperCase().endsWith(filter.toUpperCase()),
        ),
        DropDownFilterModel(
          (object) =>
              object.peca == null ||
              object.peca!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String PecaNomeText() => '($cod) ${peca == null ? '' : peca!}';
}
