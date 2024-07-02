import 'package:ageiscme_models/models/fornecedor/fornecedor_model.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_descritor_model.freezed.dart';
part 'epi_descritor_model.g.dart';

@unfreezed
abstract class EpiDescritorModel with _$EpiDescritorModel, DropDownText,DropDownFilterMixin<EpiDescritorModel> {
  const EpiDescritorModel._();

  factory EpiDescritorModel({
    required int? cod,
    required String? descricao,
    required String? numeroCA,
    required int? tipoEpi,
    required DateTime? prazoValidade,
    required bool? conferenciaVisual,
    required bool? ativo,
    required int? codInstituicao,
    required String? imagem,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    int? codFornecedor,
    FornecedorModel? fornecedor,
  }) = _EpiDescritorModel;

  factory EpiDescritorModel.fromJson(Map<String, Object?> json) =>
      _$EpiDescritorModelFromJson(json);

  static EpiDescritorModel copy(EpiDescritorModel epiDescritor) =>
      EpiDescritorModel.fromJson(epiDescritor.toJson());

  factory EpiDescritorModel.empty() => EpiDescritorModel(
        cod: 0,
        descricao: '',
        numeroCA: '',
        tipoEpi: 0,
        prazoValidade: null,
        conferenciaVisual: false,
        ativo: true,
        codInstituicao: 0,
        imagem: null,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => descricao == null ? '' : descricao!;

  String get GetTipoEpiText =>
      tipoEpi == null ? '' : EpiDescritorTipoEpiOption.getOpcaoFromId(tipoEpi!);

  List<DropDownFilterModel<EpiDescritorModel>> GetDropDownFilters(String filter) => [
        DropDownFilterModel(
          (object) =>
              object.descricao != null &&
              object.descricao.toString().endsWith(filter),
        ),
        DropDownFilterModel(
          (object) =>
              object.descricao == null ||
              object.descricao!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];
}

class EpiDescritorTipoEpiOption with DropDownText {
  final String text;
  final int cod;

  EpiDescritorTipoEpiOption(this.text, this.cod);

  static final List<EpiDescritorTipoEpiOption> tipoEpiOptions = [
    EpiDescritorTipoEpiOption('Durável', 1),
    EpiDescritorTipoEpiOption('Descartável', 2),
  ];

  static String getOpcaoFromId(int opcao) {
    Iterable<EpiDescritorTipoEpiOption>? tipo =
        tipoEpiOptions.where((element) => element.cod == opcao);

    if (tipo.isEmpty) {
      return '';
    } else {
      return tipo.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
