import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_item_inventario_model.g.dart';
part 'consulta_item_inventario_model.freezed.dart';

@unfreezed
sealed class ConsultaItemInventarioModel with _$ConsultaItemInventarioModel {
  const ConsultaItemInventarioModel._();

  factory ConsultaItemInventarioModel({
    required int? codItemDescritor,
    required String? descricaoCurta,
    required String? descricao,
    required int? qtdeCodDescritor,
    required double? valorItem,
    required String? nomeGrupo,
    required String? nomeProcessoNormal,
    required String? nomeProcessoUrgencia,
    required String? nomeProcessoEmergencia,
    required String? nomeProprietario,
    required String? situacao,
  }) = _ConsultaItemInventarioModel;

  factory ConsultaItemInventarioModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaItemInventarioModelFromJson(json);

  static ConsultaItemInventarioModel copy(ConsultaItemInventarioModel obj) {
    return ConsultaItemInventarioModel.fromJson(obj.toJson());
  }

  String get GetSituacaoText => situacao == null
      ? ''
      : ConsultaItemInventarioStatusOption.getOpcaoFromId(situacao!);
}

class ConsultaItemInventarioStatusOption with DropDownText {
  final String text;
  final String cod;

  ConsultaItemInventarioStatusOption(this.text, this.cod);

  static final List<ConsultaItemInventarioStatusOption> situacaoOptions = [
    ConsultaItemInventarioStatusOption('Bloqueado', '0'),
    ConsultaItemInventarioStatusOption('Liberado', '1'),
    ConsultaItemInventarioStatusOption('Liberado com Restrições', '2'),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<ConsultaItemInventarioStatusOption>? situacao =
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
