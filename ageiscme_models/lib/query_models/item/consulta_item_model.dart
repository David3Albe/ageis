import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_item_model.g.dart';
part 'consulta_item_model.freezed.dart';

@unfreezed
sealed class ConsultaItemModel with _$ConsultaItemModel {
  const ConsultaItemModel._();

  factory ConsultaItemModel({
    required int? cod,
    required String? idEtiqueta,
    required String? item,
    required String? descricaoCurta,
    required String? tamanhoSigla,
    required String? nomeGrupo,
    required int? qtdeProcessos,
    required String? nomeKit,
    required String? nomeProprietario,
    required DateTime? rmsValidade,
    required String? implantavel,
    required DateTime? dataAquisicao,
    required DateTime? vidaUtil,
    required String? loteProduto,
    required DateTime? dataDescarte,
    required String? situacao,
    required String? restricao,
    required double? valorItem,
    required double? pesoG,
    required String? fabricante,
    required String? fornecedor,
    required String? regAnvisa,
    required int? numeroPatrimonio,
    required int? numeroNota,
    required String? entradaSaida,
    required String? localEntrega,
    required String? localRetirada,
    required String? ultimaEtapa,
    required DateTime? ultimaAlteracao,
  }) = _ConsultaItemModel;

  factory ConsultaItemModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaItemModelFromJson(json);

  static ConsultaItemModel copy(ConsultaItemModel obj) {
    return ConsultaItemModel.fromJson(obj.toJson());
  }

  String get getStatusText => situacao == null
      ? ''
      : ConsultaItemStatusOption.getOpcaoFromId(situacao!);
}

class ConsultaItemStatusOption with DropDownText {
  final String text;
  final String cod;

  ConsultaItemStatusOption(this.text, this.cod);

  static final List<ConsultaItemStatusOption> situacaoOptions = [
    ConsultaItemStatusOption('Bloqueado', '0'),
    ConsultaItemStatusOption('Liberado', '1'),
    ConsultaItemStatusOption('Liberado com Restrições', '2'),
    ConsultaItemStatusOption('Pendente no Kit', '3'),
    ConsultaItemStatusOption('DataMatrix Danificado', '4'),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<ConsultaItemStatusOption>? situacao =
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
