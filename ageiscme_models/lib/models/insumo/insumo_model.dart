import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'insumo_model.freezed.dart';
part 'insumo_model.g.dart';

@unfreezed
abstract class InsumoModel
    with _$InsumoModel, DropDownText, DropDownFilterMixin<InsumoModel> {
  const InsumoModel._();

  factory InsumoModel({
    required int? cod,
    required String? codErp3Albe,
    required String? nome,
    required String? descricao,
    required String? unidadeMedida,
    required String? embalagem,
    required String? fabricante,
    required String? fornecedor,
    required String? registroAnvisa,
    required int? codBarra,
    required double? qtdeEmbalagem,
    required double? estoqueMaximo,
    required double? estoqueMinimo,
    required double? pontoReposicao,
    required int? codItem,
    required int? prazoEntregaDias,
    required int? validadeAposAtivacaoDias,
    required bool? controleEstoque,
    required bool? testeInsumoObrigatorio,
    required bool? ativo,
    required int? codFabricante,
    required int? codFornecedor,
    required int? codUnidadeMedida,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required ItemModel? item,
    required FabricanteModel? fabricanteItem,
    required FornecedorModel? fornecedorItem,
    required UnidadeMedidaModel? unidadeMedidaItem,
  }) = _InsumoModel;

  factory InsumoModel.fromJson(Map<String, Object?> json) =>
      _$InsumoModelFromJson(json);

  static InsumoModel copy(InsumoModel insumo) =>
      InsumoModel.fromJson(insumo.toJson());

  factory InsumoModel.empty() => InsumoModel(
        cod: 0,
        codErp3Albe: '',
        nome: '',
        descricao: '',
        unidadeMedida: '',
        embalagem: '',
        fabricante: '',
        fornecedor: '',
        registroAnvisa: '',
        codBarra: 0,
        qtdeEmbalagem: 0,
        estoqueMaximo: 0,
        estoqueMinimo: 0,
        pontoReposicao: 0,
        codItem: null,
        prazoEntregaDias: 0,
        validadeAposAtivacaoDias: 0,
        controleEstoque: false,
        testeInsumoObrigatorio: false,
        ativo: true,
        codFabricante: null,
        codFornecedor: null,
        codUnidadeMedida: null,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
        item: null,
        fabricanteItem: null,
        fornecedorItem: null,
        unidadeMedidaItem: null,
      );

  String GetDropDownText() => nome == null ? '' : nome!;

  String GetDropDownTextUnidadeMedida() =>
      unidadeMedida == null ? '' : unidadeMedida!;

  List<DropDownFilterModel<InsumoModel>> GetDropDownFilters(String filter) => [
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

  String GetNomeInsumoText() => '${nome == null ? '' : nome!}';
}
