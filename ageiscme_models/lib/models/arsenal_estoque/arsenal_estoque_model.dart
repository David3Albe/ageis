import 'package:ageiscme_models/mixins/local_mixin.dart';
import 'package:ageiscme_models/models/local_instituicao/local_instituicao_model.dart';
import 'package:ageiscme_models/models/localizacao_arsenal/localizacao_arsenal_model.dart';
import 'package:ageiscme_models/models/processo_etapa/processo_etapa_model.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'arsenal_estoque_model.freezed.dart';
part 'arsenal_estoque_model.g.dart';

@unfreezed
sealed class ArsenalEstoqueModel
    with
        _$ArsenalEstoqueModel,
        DropDownText,
        DropDownFilterMixin<ArsenalEstoqueModel>,
        LocalMixin {
  ArsenalEstoqueModel._();

  factory ArsenalEstoqueModel({
    required int? cod,
    required String? nome,
    required String? codBarra,
    required int? codLocal,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    required List<ProcessoEtapaModel>? processosEtapas,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required LocalInstituicaoModel? local,
    required List<LocalizacaoArsenalModel>? locaisArs,
  }) = _ArsenalEstoqueModel;

  factory ArsenalEstoqueModel.fromJson(Map<String, Object?> json) =>
      _$ArsenalEstoqueModelFromJson(json);

  static ArsenalEstoqueModel copy(ArsenalEstoqueModel arsenalEstoque) {
    return ArsenalEstoqueModel.fromJson(arsenalEstoque.toJson());
  }

  factory ArsenalEstoqueModel.empty() => ArsenalEstoqueModel(
        cod: 0,
        nome: '',
        codBarra: '',
        codLocal: 0,
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
        local: null,
        processosEtapas: null,
        locaisArs: null,
      );

  String GetDropDownText() => nome == null ? '' : nome!;

  List<DropDownFilterModel<ArsenalEstoqueModel>> GetDropDownFilters(
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

  String ArsenalEstoqueNomeText() => '${nome == null ? '' : nome!}';
}
