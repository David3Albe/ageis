import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_descritor_model.freezed.dart';
part 'kit_descritor_model.g.dart';

@unfreezed
abstract class KitDescritorModel
    with
        _$KitDescritorModel,
        DropDownText,
        DropDownFilterMixin<KitDescritorModel> {
  const KitDescritorModel._();

  factory KitDescritorModel({
    required int? cod,
    required String? nome,
    required String? descricao,
    required String? tamanhoSigla,
    required int? codEmbalagem,
    required int codInstituicao,
    required int? codTipoProcessoNormal,
    required int? codTipoProcessoUrgencia,
    required int? codTipoProcessoEmergencia,
    required int? codCusto,
    required bool ativo,
    required bool? exigeProntuario,
    required String? imagem,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    List<ItemDescritorKitModel>? itensDescritorKits,
    required TamanhoModel? tamanho,
    required EmbalagemModel? embalagem,
    required ProcessoTipoModel? tipoProcesso,
    required ProcessoTipoModel? tipoProcessoEmergencia,
    required ProcessoTipoModel? tipoProcessoUrgencia,
    required CentroCustoModel? centroCusto,
  }) = _KitDescritorModel;

  factory KitDescritorModel.fromJson(Map<String, Object?> json) =>
      _$KitDescritorModelFromJson(json);

  static KitDescritorModel copy(KitDescritorModel kitDescritor) =>
      KitDescritorModel.fromJson(kitDescritor.toJson());

  factory KitDescritorModel.empty() => KitDescritorModel(
        cod: 0,
        nome: '',
        descricao: '',
        tamanhoSigla: '',
        codEmbalagem: null,
        codInstituicao: 0,
        codTipoProcessoEmergencia: null,
        codTipoProcessoNormal: 0,
        codTipoProcessoUrgencia: 0,
        codCusto: null,
        ativo: true,
        exigeProntuario: false,
        imagem: null,
        ultimaAlteracao: null,
        tstamp: '',
        tamanho: null,
        embalagem: null,
        tipoProcesso: null,
        tipoProcessoEmergencia: null,
        tipoProcessoUrgencia: null,
        centroCusto: null,
        itensDescritorKits: null,
      );
  String GetDropDownText() => nome == null ? '' : nome!;

  String GetDropDownTextDescricao() => descricao == null ? '' : descricao!;

  String GetDropDownTextTamanho() => tamanhoSigla == null ? '' : tamanhoSigla!;

  List<DropDownFilterModel<KitDescritorModel>> GetDropDownFilters(
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

  String KitDescritorText() => '${nome == null ? '' : nome!}';
}
