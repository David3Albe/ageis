import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'estoque_disponivel_model.g.dart';
part 'estoque_disponivel_model.freezed.dart';

@unfreezed
sealed class EstoqueDisponivelModel with _$EstoqueDisponivelModel {
  const EstoqueDisponivelModel._();

  factory EstoqueDisponivelModel({
    required int? cod,
    required int? codEstoque,
    required int? codLocalEstoque,
    required int? codKit,
    required int? codItem,
    required bool? removido,
    required DateTime? dataEntrada,
    required DateTime? dataValidade,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required ArsenalEstoqueModel? arsenalEstoque,
    required ItemModel? item,
    required KitModel? kit,
    required LocalizacaoArsenalModel? localizacaoArsenal,
  }) = _EstoqueDisponivelModel;

  factory EstoqueDisponivelModel.fromJson(Map<String, Object?> json) =>
      _$EstoqueDisponivelModelFromJson(json);

  static EstoqueDisponivelModel copy(EstoqueDisponivelModel estoqueDisponivel) {
    return EstoqueDisponivelModel.fromJson(estoqueDisponivel.toJson());
  }

  factory EstoqueDisponivelModel.empty() => EstoqueDisponivelModel(
        cod: 0,
        arsenalEstoque: null,
        codEstoque: 0,
        codItem: 0,
        codKit: 0,
        codLocalEstoque: 0,
        dataEntrada: null,
        dataValidade: null,
        item: null,
        kit: null,
        localizacaoArsenal: null,
        removido: null,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
      );
}
