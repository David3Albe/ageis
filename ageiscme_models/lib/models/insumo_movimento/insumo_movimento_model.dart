import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insumo_movimento_model.g.dart';
part 'insumo_movimento_model.freezed.dart';

@unfreezed
sealed class InsumoMovimentoModel with _$InsumoMovimentoModel {
  const InsumoMovimentoModel._();

  factory InsumoMovimentoModel({
    int? cod,
    int? codInsumo,
    int? codBarra,
    int? codUsuario,
    String? flagEntradaSaida,
    int? codDeposito,
    DateTime? dataHora,
    double? quantidade,
    String? lote,
    DateTime? dataFabricacao,
    DateTime? dataValidade,
    String? nroTotalFiscal,
    double? precoNotaFiscal,
    double? precoCusto3Albe,
    double? precoVenda3Albe,
    int? codEquipamentoInsumo,
    int? codDestinoResiduos,
    int? codInstituicao,
    DateTime? ultimaAlteracao,
    DateTime? dataNotaFiscal,
    @JsonKey(name: 'tStamp') String? tstamp,
    InsumoModel? insumo,
    DestinoResiduoModel? destinoResiduo,
    EquipamentoModel? equipamento,
    UsuarioModel? usuario,
    DepositoInsumoModel? deposito,
  }) = _InsumoMovimentoModel;

  factory InsumoMovimentoModel.fromJson(Map<String, Object?> json) =>
      _$InsumoMovimentoModelFromJson(json);

  static InsumoMovimentoModel copy(InsumoMovimentoModel centroCusto) {
    return InsumoMovimentoModel.fromJson(centroCusto.toJson());
  }

  factory InsumoMovimentoModel.empty() => InsumoMovimentoModel(
        cod: 0,
        codBarra: null,
        codDeposito: null,
        codDestinoResiduos: null,
        codEquipamentoInsumo: null,
        codInsumo: null,
        codUsuario: null,
        dataFabricacao: null,
        dataHora: DateTime.now(),
        dataNotaFiscal: null,
        dataValidade: null,
        destinoResiduo: null,
        equipamento: null,
        flagEntradaSaida: '1',
        insumo: null,
        lote: null,
        nroTotalFiscal: null,
        precoCusto3Albe: null,
        precoNotaFiscal: null,
        precoVenda3Albe: null,
        quantidade: null,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
        deposito: null,
        usuario: null,
      );
  String get getTipoMovimentoText => flagEntradaSaida == null
      ? ''
      : TipoMovimentoOption.getOpcaoFromId(flagEntradaSaida!);
}

class TipoMovimentoOption with DropDownText {
  final String text;
  final String cod;

  TipoMovimentoOption(this.text, this.cod);

  static final List<TipoMovimentoOption> tipoMovimentoOption = [
    TipoMovimentoOption('Ajuste', '0'),
    TipoMovimentoOption('Entrada', '1'),
    TipoMovimentoOption('Saída', '2'),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<TipoMovimentoOption>? tipoMovimento =
        tipoMovimentoOption.where((element) => element.cod.toString() == opcao);

    if (tipoMovimento.isEmpty) {
      return '';
    } else {
      return tipoMovimento.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
