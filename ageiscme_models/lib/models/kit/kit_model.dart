import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/kit/kit_mixin.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kit_model.freezed.dart';
part 'kit_model.g.dart';

@unfreezed
abstract class KitModel
    with _$KitModel, KitMixin, DropDownFilterMixin<KitModel> {
  const KitModel._();

  factory KitModel({
    required int? cod,
    required String? codBarra,
    required int? codCor1,
    required int? codCor2,
    required int? codCor3,
    required int? codCor4,
    required String? status,
    required String? restricao,
    required int? codDescritorKit,
    required int? codConjunto,
    required int? codInstituicao,
    required String? preparo,
    required int? codProcessoLeitura,
    required int? codEmbalagem,
    required EmbalagemModel? embalagem,
    required String? imagem,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tStamp,
    required KitDescritorModel? descritor,
    required List<ItemModel>? itens,
    required KitCorModel? cor1,
    required KitCorModel? cor2,
    required KitCorModel? cor3,
    required KitCorModel? cor4,
    DateTime? dataDescarte,
  }) = _KitModel;

  factory KitModel.fromJson(Map<String, Object?> json) =>
      _$KitModelFromJson(json);

  static KitModel copy(KitModel kitModel) =>
      KitModel.fromJson(kitModel.toJson());

  factory KitModel.empty() => KitModel(
        cod: 0,
        codBarra: '',
        codCor1: null,
        codCor2: null,
        codCor3: null,
        codCor4: null,
        status: '',
        restricao: '',
        codDescritorKit: null,
        codConjunto: null,
        codInstituicao: 0,
        preparo: '0',
        codProcessoLeitura: null,
        codEmbalagem: null,
        embalagem: null,
        imagem: null,
        ultimaAlteracao: null,
        tStamp: '',
        descritor: null,
        itens: [],
        cor1: null,
        cor2: null,
        cor3: null,
        cor4: null,
      );

  String GetDropDownText() => codBarra ?? '';

  String get getResultText => status == null
      ? ''
      : EquipamentoManutencaoResultOption.getOpcaoFromId(status!);

  List<DropDownFilterModel<KitModel>> GetDropDownFilters(String filter) => [
        DropDownFilterModel(
          (object) =>
              object.codBarra != null && object.codBarra!.endsWith(filter),
        ),
        DropDownFilterModel(
          (object) =>
              object.descritor != null &&
              object.descritor!.descricao != null &&
              object.descritor!.descricao!
                  .toUpperCase()
                  .contains(filter.toUpperCase()),
        ),
      ];

  String CodBarraDescritorText() {
    if (descritor == null || descritor!.descricao == null) {
      return codBarra ?? '';
    }
    return '($codBarra) ${descritor != null && descritor!.descricao != null ? descritor!.descricao! : ''}';
  }
}

class KitSituacaoOption with DropDownText {
  final String text;
  final String cod;

  KitSituacaoOption(this.text, this.cod);

  static final List<KitSituacaoOption> situacaoOptions = [
    KitSituacaoOption('Bloqueado', '0'),
    KitSituacaoOption('Liberado', '1'),
    KitSituacaoOption('Liberado com Restrições', '2'),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<KitSituacaoOption>? result =
        situacaoOptions.where((element) => element.cod.toString() == opcao);

    if (result.isEmpty) {
      return '';
    } else {
      return result.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
