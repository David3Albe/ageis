import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'servico_tipo_model.freezed.dart';
part 'servico_tipo_model.g.dart';

@unfreezed
abstract class ServicoTipoModel
    with
        _$ServicoTipoModel,
        DropDownText,
        DropDownFilterMixin<ServicoTipoModel> {
  const ServicoTipoModel._();

  factory ServicoTipoModel({
    required int? cod,
    required String? nome,
    required int? codInstituicao,
    required bool? ativo,
    required bool? monitoramento,
    required bool? servicosEquipamentos,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') String? tstamp,
  }) = _ServicoTipoModel;

  factory ServicoTipoModel.fromJson(Map<String, Object?> json) =>
      _$ServicoTipoModelFromJson(json);

  static ServicoTipoModel copy(ServicoTipoModel servicoTipo) {
    return ServicoTipoModel.fromJson(servicoTipo.toJson());
  }

  factory ServicoTipoModel.empty() => ServicoTipoModel(
        cod: 0,
        nome: '',
        codInstituicao: 0,
        ativo: true,
        monitoramento: false,
        servicosEquipamentos: false,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => nome == null ? '' : nome!;

  List<DropDownFilterModel<ServicoTipoModel>> GetDropDownFilters(
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

  String ServicoTipoNomeText() => '($cod) ${nome == null ? '' : nome!}';
}
