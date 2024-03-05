import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'estoque_disponivel_rotulado_model.g.dart';
part 'estoque_disponivel_rotulado_model.freezed.dart';

@unfreezed
sealed class EstoqueDisponivelRotuladoModel
    with _$EstoqueDisponivelRotuladoModel {
  const EstoqueDisponivelRotuladoModel._();

  factory EstoqueDisponivelRotuladoModel({
    required int? cod,
    required int? codEstoque,
    required int? codItem,
    required int quantidade,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required ArsenalEstoqueModel? arsenalEstoque,
    required ItemModel? item,
  }) = _EstoqueDisponivelRotuladoModel;

  factory EstoqueDisponivelRotuladoModel.fromJson(Map<String, Object?> json) =>
      _$EstoqueDisponivelRotuladoModelFromJson(json);

  static EstoqueDisponivelRotuladoModel copy(
      EstoqueDisponivelRotuladoModel estoqueDisponivelRotulado) {
    return EstoqueDisponivelRotuladoModel.fromJson(
        estoqueDisponivelRotulado.toJson());
  }

  factory EstoqueDisponivelRotuladoModel.empty() =>
      EstoqueDisponivelRotuladoModel(
        cod: 0,
        codEstoque: 0,
        codItem: 0,
        quantidade: 0,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
        arsenalEstoque: null,
        item: null,
      );
}
