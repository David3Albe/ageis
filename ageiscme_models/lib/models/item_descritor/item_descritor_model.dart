import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/item_descritor_consignado/item_descritor_consignado_model.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_descritor_model.freezed.dart';
part 'item_descritor_model.g.dart';

@unfreezed
abstract class ItemDescritorModel
    with
        _$ItemDescritorModel,
        DropDownText,
        DropDownFilterMixin<ItemDescritorModel> {
  const ItemDescritorModel._();

  factory ItemDescritorModel({
    required int? cod,
    required String? descricaoCurta,
    required String? descricaoCompleta,
    required String? foto,
    required String? tamanhoSigla,
    required int? codTipoProcessoNormal,
    required int? codTipoProcessoUrgencia,
    required int? codTipoProcessoEmergencia,
    required int? codGrupoItem,
    required int? codEmbalagem,
    required int? codInstituicao,
    required int? limiteProcessos,
    required int? codCusto,
    required double? cm,
    required double? peso,
    required double? volume,
    required bool? ativo,
    required bool? consignado,
    required bool? complementar,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required GrupoMaterialModel? grupoMaterial,
    required EmbalagemModel? embalagem,
    required CentroCustoModel? centroCusto,
    required ProcessoTipoModel? tipoProcesso,
    required ProcessoTipoModel? tipoProcessoUrgencia,
    required ProcessoTipoModel? tipoProcessoEmergencia,
    required TamanhoModel? tamanho,
    required List<ItemDescritorConsignadoModel>? itensDescritoresConsignados,
  }) = _ItemDescritorModel;

  factory ItemDescritorModel.fromJson(Map<String, Object?> json) =>
      _$ItemDescritorModelFromJson(json);

  static ItemDescritorModel copy(ItemDescritorModel itemDescritor) {
    return ItemDescritorModel.fromJson(itemDescritor.toJson());
  }

  factory ItemDescritorModel.empty() => ItemDescritorModel(
        cod: 0,
        descricaoCompleta: '',
        descricaoCurta: '',
        foto: null,
        tamanhoSigla: '',
        codTipoProcessoNormal: 0,
        codTipoProcessoEmergencia: null,
        codTipoProcessoUrgencia: null,
        codGrupoItem: 0,
        codCusto: 0,
        codEmbalagem: 0,
        codInstituicao: 0,
        limiteProcessos: null,
        cm: null,
        peso: 0,
        volume: 0,
        ativo: true,
        consignado: false,
        complementar: false,
        ultimaAlteracao: null,
        tstamp: '',
        grupoMaterial: null,
        embalagem: null,
        centroCusto: null,
        tipoProcesso: null,
        tipoProcessoUrgencia: null,
        tipoProcessoEmergencia: null,
        tamanho: null,
        itensDescritoresConsignados: null,
      );

  String GetDropDownText() => descricaoCurta == null ? '' : descricaoCurta!;

  List<DropDownFilterModel<ItemDescritorModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) =>
              object.cod != null && object.cod.toString().endsWith(filter),
        ),
        DropDownFilterModel(
          (object) =>
              object.descricaoCurta == null ||
              object.descricaoCurta!
                  .toUpperCase()
                  .contains(filter.toUpperCase()),
        ),
      ];

  String ItemDescritorText() {
    String descricao = descricaoCurta ?? '';
    if (cm == null) return descricao;
    if (descricao.isNotEmpty) descricao += ' - ';
    descricao += cm.toString();
    return descricao;
  }
}
