import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_estoque_disponivel_rotulado_model.g.dart';
part 'consulta_estoque_disponivel_rotulado_model.freezed.dart';

@unfreezed
sealed class ConsultaEstoqueDisponivelRotuladoModel
    with _$ConsultaEstoqueDisponivelRotuladoModel {
  const ConsultaEstoqueDisponivelRotuladoModel._();

  factory ConsultaEstoqueDisponivelRotuladoModel({
    required int? codItem,
    required int? quantidade,
    required String? proprietario,
    required ArsenalEstoqueModel? arsenalEstoque,
    required ItemModel? item,
    required DateTime? dataHora,
    required String? entradaSaida,
    required String? etiqueta,
    required String? descricaoItem,
    required String? nomeProprietario,
    required String? equipamentoNome,
    required String? etapaProcesso,
    required String? tipoProcesso,
    required String? nivelPrioridade,
    required String? usuario,
    required String? prontuarioRetirada,
    required String? origem,
    required String? destino,
    required String? circulante,
    required int? codItemRotulo,
    required String? motivo,
    required String? motivoQuebraFluxo,
    required String? observacao,
    required int? codKit,
  }) = _ConsultaEstoqueDisponivelRotuladoModel;

  factory ConsultaEstoqueDisponivelRotuladoModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaEstoqueDisponivelRotuladoModelFromJson(json);

  static ConsultaEstoqueDisponivelRotuladoModel copy(
      ConsultaEstoqueDisponivelRotuladoModel obj) {
    return ConsultaEstoqueDisponivelRotuladoModel.fromJson(obj.toJson());
  }

  String get getPrioridadeText => nivelPrioridade == null
      ? ''
      : PrioridadeOption.getOpcaoFromId(nivelPrioridade!);
}

class PrioridadeOption with DropDownText {
  final String text;
  final String cod;

  PrioridadeOption(this.text, this.cod);

  static final List<PrioridadeOption> situacaoOptions = [
    PrioridadeOption('Normal', '1'),
    PrioridadeOption('Urgência', '2'),
    PrioridadeOption('Emergência', '3'),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<PrioridadeOption>? situacao =
        situacaoOptions.where((element) => element.cod.toString() == opcao);

    if (situacao.isEmpty) {
      return '';
    } else {
      return situacao.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
