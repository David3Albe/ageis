import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insumo_teste_model.g.dart';
part 'insumo_teste_model.freezed.dart';

@unfreezed
sealed class InsumoTesteModel with _$InsumoTesteModel {
  const InsumoTesteModel._();

  factory InsumoTesteModel({
    required int? cod,
    required int? codInstituicao,
    required int? codMovimentoInsumo,
    required int? codInsumo,
    required int? codDeposito,
    required int? codUsuario,
    required int? codUsuarioLiberacao,
    required String? comunicadoAnvisa,
    required String? comunicadoFabricante,
    required DateTime? data,
    required String? imagemDocAnexo,
    required String? indicador,
    required String? resultado,
    required String? lote,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required DateTime? ultimaAlteracao,
    required InsumoMovimentoModel? insumoMovimento,
    required DepositoInsumoModel? depositoInsumo,
    required InsumoModel? insumo,
    required UsuarioModel? usuario,
  }) = _InsumoTesteModel;

  factory InsumoTesteModel.fromJson(Map<String, Object?> json) =>
      _$InsumoTesteModelFromJson(json);

  static InsumoTesteModel copy(InsumoTesteModel insumoTeste) {
    return InsumoTesteModel.fromJson(insumoTeste.toJson());
  }

  factory InsumoTesteModel.empty() => InsumoTesteModel(
        cod: 0,
        codInstituicao: 0,
        codMovimentoInsumo: null,
        codInsumo: 0,
        codDeposito: null,
        codUsuario: null,
        codUsuarioLiberacao: null,
        comunicadoAnvisa: null,
        comunicadoFabricante: null,
        data: DateTime.now(),
        imagemDocAnexo: null,
        indicador: null,
        resultado: null,
        lote: null,
        tstamp: '',
        ultimaAlteracao: null,
        insumoMovimento: null,
        depositoInsumo: null,
        insumo: null,
        usuario: null,
      );
  String get getSituacaoText =>
      resultado == null ? '' : SituacaoOption.getOpcaoFromId(resultado!);
}

class SituacaoOption with DropDownText {
  final String text;
  final String cod;

  SituacaoOption(this.text, this.cod);

  static final List<SituacaoOption> situacaoOption = [
    SituacaoOption('Conforme', '0'),
    SituacaoOption('Não Conforme', '1'),
    SituacaoOption('Em Quarentena', '2'),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<SituacaoOption>? situacao =
        situacaoOption.where((element) => element.cod.toString() == opcao);

    if (situacao.isEmpty) {
      return '';
    } else {
      return situacao.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
