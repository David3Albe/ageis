import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_cor_model.freezed.dart';
part 'kit_cor_model.g.dart';

@unfreezed
abstract class KitCorModel
    with _$KitCorModel, DropDownText, DropDownFilterMixin<KitCorModel> {
  const KitCorModel._();

  factory KitCorModel({
    required int? cod,
    required String? nome,
    required int? red,
    required int? green,
    required int? blue,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _KitCorModel;

  factory KitCorModel.fromJson(Map<String, Object?> json) =>
      _$KitCorModelFromJson(json);

  static KitCorModel copy(KitCorModel kitCor) {
    return KitCorModel.fromJson(kitCor.toJson());
  }

  factory KitCorModel.empty() => KitCorModel(
        cod: 0,
        nome: '',
        red: null,
        green: null,
        blue: null,
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => nome == null ? '' : nome!;

  List<DropDownFilterModel<KitCorModel>> GetDropDownFilters(String filter) => [
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

  String GetNomeKitCorText() => '${nome == null ? '' : nome!}';
}
