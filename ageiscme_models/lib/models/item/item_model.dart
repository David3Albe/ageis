import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/item_consignado/item_consignado_model.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@unfreezed
abstract class ItemModel
    with _$ItemModel, DropDownText, DropDownFilterMixin<ItemModel> {
  const ItemModel._();

  factory ItemModel({
    required int? cod,
    required String? idEtiqueta,
    required String? descricao,
    required String? fabricante,
    required String? fornecedor,
    required String? registroAnvisa,
    required String? status,
    required String? restricao,
    required String? refFornecedor,
    required int? codDescritor,
    required int? codProprietario,
    required int? codConjunto,
    required int? codKit,
    required int? codInstituicao,
    required int? codProcessoLeitura,
    required int? codEmbalagem,
    required EmbalagemModel? embalagem,
    required int? qtdeProcessos,
    required int? codEtiqueta,
    required int? pendenteRecepcao,
    required int? responsavelPendenteKit,
    required int? codFabricantes,
    required int? codFornecedores,
    required int? codUsuarioCadastro,
    required DateTime? dataCadastro,
    required DateTime? dataDescarte,
    required DateTime? dataAquisicao,
    required DateTime? vidaUtil,
    required DateTime? rmsValidade,
    required DateTime? dataHoraPendenteKit,
    required bool? repositorio,
    required bool? implantavel,
    required int? numeroPatrimonio,
    required int? numeroNota,
    required double? valorItem,
    required DateTime? ultimaAlteracao,
    required ItemDescritorModel? descritor,
    required ProprietarioModel? proprietario,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required ItemDescritorModel? itemDescritor,
    required EtiquetaModel? etiqueta,
    required KitModel? kit,
    required UsuarioModel? usuario,
    required List<ItemConsignadoModel>? itensConsignados,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, Object?> json) =>
      _$ItemModelFromJson(json);

  static ItemModel copy(ItemModel item) {
    return ItemModel.fromJson(item.toJson());
  }

  factory ItemModel.empty() => ItemModel(
        cod: 0,
        idEtiqueta: '',
        descricao: null,
        fabricante: null,
        fornecedor: null,
        registroAnvisa: null,
        status: null,
        restricao: null,
        refFornecedor: null,
        codDescritor: null,
        codProprietario: null,
        codConjunto: null,
        codKit: null,
        codInstituicao: 0,
        codProcessoLeitura: null,
        codEmbalagem: null,
        embalagem: null,
        qtdeProcessos: null,
        codEtiqueta: null,
        pendenteRecepcao: 0,
        responsavelPendenteKit: 0,
        codFabricantes: null,
        codFornecedores: null,
        codUsuarioCadastro: null,
        dataAquisicao: null,
        dataCadastro: DateTime.now(),
        dataDescarte: null,
        dataHoraPendenteKit: null,
        vidaUtil: null,
        rmsValidade: null,
        repositorio: false,
        implantavel: false,
        numeroPatrimonio: null,
        numeroNota: null,
        valorItem: null,
        ultimaAlteracao: null,
        tstamp: null,
        proprietario: null,
        descritor: null,
        itemDescritor: null,
        etiqueta: null,
        kit: null,
        usuario: null,
        itensConsignados: null,
      );

  String GetDropDownText() => descricao == null ? '' : descricao!;

  String GetDropDownTextIdEtiqueta() => idEtiqueta == null ? '' : idEtiqueta!;

  List<DropDownFilterModel<ItemModel>> GetDropDownFilters(String filter) => [
        DropDownFilterModel(
          (object) =>
              object.idEtiqueta != null &&
              object.idEtiqueta!.toUpperCase().endsWith(filter.toUpperCase()),
        ),
        DropDownFilterModel(
          (object) =>
              object.descricao == null ||
              object.descricao!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String EtiquetaDescricaoText() =>
      '($idEtiqueta) ${descricao == null ? '' : descricao!}';

  String get GetSituacaoText =>
      status == null ? '' : ItemSituacaoOption.getSituacaoOpcaoFromId(status!);
}

class ItemSituacaoOption with DropDownText {
  final String text;
  final String cod;

  ItemSituacaoOption(this.text, this.cod);

  static final List<ItemSituacaoOption> situacaoOptions = [
    ItemSituacaoOption('Bloqueado', '0'),
    ItemSituacaoOption('Liberado', '1'),
    ItemSituacaoOption('Liberado com Restrições', '2'),
    ItemSituacaoOption('Pendente no Kit', '3'),
    ItemSituacaoOption('DataMatrix Danificado', '4'),
  ];

  static String getSituacaoOpcaoFromId(String opcao) {
    Iterable<ItemSituacaoOption>? situacao =
        situacaoOptions.where((element) => element.cod == opcao);

    if (situacao.isEmpty) {
      return '';
    } else {
      return situacao.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
