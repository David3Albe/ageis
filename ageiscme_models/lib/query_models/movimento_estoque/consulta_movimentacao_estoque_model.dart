import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_movimentacao_estoque_model.g.dart';
part 'consulta_movimentacao_estoque_model.freezed.dart';

@unfreezed
sealed class ConsultaMovimentacaoEstoqueModel
    with _$ConsultaMovimentacaoEstoqueModel {
  const ConsultaMovimentacaoEstoqueModel._();

  factory ConsultaMovimentacaoEstoqueModel({
    required int? cod,
    required DateTime? dataHora,
    required String? lote,
    required double? quantidade,
    required double? precoCusto3Albe,
    required String? flagEntradaSaida,
    required InsumoModel? insumo,
    required EquipamentoModel? equipamento,
    required DestinoResiduoModel? destinoResiduo,
  }) = _ConsultaMovimentacaoEstoqueModel;

  factory ConsultaMovimentacaoEstoqueModel.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaMovimentacaoEstoqueModelFromJson(json);

  static ConsultaMovimentacaoEstoqueModel copy(
      ConsultaMovimentacaoEstoqueModel obj) {
    return ConsultaMovimentacaoEstoqueModel.fromJson(obj.toJson());
  }

  String get GetEntradaSaidaText => flagEntradaSaida == null
      ? ''
      : EntradaSaidaOption.getEntradaSaidaOpcaoFromId(flagEntradaSaida!);
}

class EntradaSaidaOption with DropDownText {
  final String text;
  final String cod;

  EntradaSaidaOption(this.text, this.cod);

  static final List<EntradaSaidaOption> entradaSaidaOptions = [
    EntradaSaidaOption('Ajuste', '0'),
    EntradaSaidaOption('Entrada', '1'),
    EntradaSaidaOption('Saída', '2'),
  ];

  static String getEntradaSaidaOpcaoFromId(String opcao) {
    Iterable<EntradaSaidaOption> situacao =
        entradaSaidaOptions.where((element) => element.cod == opcao);

    if (situacao.isEmpty) {
      return '';
    } else {
      return situacao.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
