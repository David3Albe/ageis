import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insumo_saldo_model.g.dart';
part 'insumo_saldo_model.freezed.dart';

@unfreezed
sealed class InsumoSaldoModel with _$InsumoSaldoModel {
  const InsumoSaldoModel._();

  factory InsumoSaldoModel({
    required int? cod,
    required int? codInsumo,
    required int? codDeposito,
    required double? qtdeDisponivel,
    required String? lote,
    required int? codBarra,
    required DateTime? dataFabricacao,
    required DateTime? dataValidadePosAtividade,
    required DateTime? dataValidade,
    required String? status,
    required double? precoUnVendaMedio,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required DepositoInsumoModel? depositoInsumo,
    required InsumoModel? insumo,
  }) = _InsumoSaldoModel;

  factory InsumoSaldoModel.fromJson(Map<String, Object?> json) =>
      _$InsumoSaldoModelFromJson(json);

  static InsumoSaldoModel copy(InsumoSaldoModel centroCusto) {
    return InsumoSaldoModel.fromJson(centroCusto.toJson());
  }

  factory InsumoSaldoModel.empty() => InsumoSaldoModel(
        cod: 0,
        codInsumo: 0,
        codDeposito: 0,
        qtdeDisponivel: 0,
        lote: '',
        codBarra: 0,
        dataFabricacao: null,
        dataValidade: null,
        dataValidadePosAtividade: null,
        status: '',
        precoUnVendaMedio: 0,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
        depositoInsumo: null,
        insumo: null,
      );

  String get getStatusText =>
      status == null ? '' : DepositoInsumoStatusOption.getOpcaoFromId(status!);
}

class InsumoSaldoStatusOption with DropDownText {
  final String text;
  final String cod;

  InsumoSaldoStatusOption(this.text, this.cod);

  static final List<InsumoSaldoStatusOption> situacaoOptions = [
    InsumoSaldoStatusOption('Conforme', '0'),
    InsumoSaldoStatusOption('Não Conforme', '1'),
    InsumoSaldoStatusOption('Em Quarentena', '2'),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<InsumoSaldoStatusOption>? situacao =
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
