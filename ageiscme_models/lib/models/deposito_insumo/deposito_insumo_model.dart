import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'deposito_insumo_model.freezed.dart';
part 'deposito_insumo_model.g.dart';

@unfreezed
abstract class DepositoInsumoModel
    with
        _$DepositoInsumoModel,
        DropDownText,
        DropDownFilterMixin<DepositoInsumoModel> {
  const DepositoInsumoModel._();

  factory DepositoInsumoModel({
    required int? cod,
    required String? nome,
    required String? status,
    required int? codLocal,
    required int? codBarra,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required LocalInstituicaoModel? local,
  }) = _DepositoInsumoModel;

  factory DepositoInsumoModel.fromJson(Map<String, Object?> json) =>
      _$DepositoInsumoModelFromJson(json);

  static DepositoInsumoModel copy(DepositoInsumoModel depositoInsumo) =>
      DepositoInsumoModel.fromJson(depositoInsumo.toJson());

  factory DepositoInsumoModel.empty() => DepositoInsumoModel(
        cod: 0,
        nome: '',
        status: '',
        codLocal: 0,
        codBarra: null,
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
        local: null,
      );

  @override
  String GetDropDownText() => nome == null ? '' : nome!;

  String get getStatusText =>
      status == null ? '' : DepositoInsumoStatusOption.getOpcaoFromId(status!);

  List<DropDownFilterModel<DepositoInsumoModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) =>
              object.nome != null &&
              object.nome!.toUpperCase().endsWith(filter.toUpperCase()),
        ),
        DropDownFilterModel(
          (object) =>
              object.nome == null ||
              object.nome!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String GetNomeDepositoText() => '${nome == null ? '' : nome!}';
}

class DepositoInsumoStatusOption with DropDownText {
  final String text;
  final String cod;

  DepositoInsumoStatusOption(this.text, this.cod);

  static final List<DepositoInsumoStatusOption> situacaoOptions = [
    DepositoInsumoStatusOption('Conforme', '0'),
    DepositoInsumoStatusOption('Não Conforme', '1'),
    DepositoInsumoStatusOption('Em Quarentena', '2'),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<DepositoInsumoStatusOption>? situacao =
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
