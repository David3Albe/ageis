// ignore_for_file: unnecessary_null_comparison

import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'local_instituicao_model.freezed.dart';
part 'local_instituicao_model.g.dart';

@unfreezed
abstract class LocalInstituicaoModel
    with
        _$LocalInstituicaoModel,
        DropDownText,
        DropDownFilterMixin<LocalInstituicaoModel> {
  const LocalInstituicaoModel._();

  factory LocalInstituicaoModel({
    required int? cod,
    required String nome,
    required String? localizacao,
    required String? responsavel,
    required String? contato,
    required String? codBarra,
    required int? codInstituicao,
    required int? codCentroCusto,
    required bool? ativo,
    required bool? exigeProntuario,
    required bool? localConferencia,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required CentroCustoModel? centroCusto,
  }) = _LocalInstituicaoModel;

  factory LocalInstituicaoModel.fromJson(Map<String, Object?> json) =>
      _$LocalInstituicaoModelFromJson(json);

  static LocalInstituicaoModel copy(LocalInstituicaoModel localInstituicao) {
    return LocalInstituicaoModel.fromJson(localInstituicao.toJson());
  }

  factory LocalInstituicaoModel.empty() => LocalInstituicaoModel(
        cod: 0,
        nome: '',
        localizacao: '',
        responsavel: '',
        contato: '',
        codBarra: '',
        codInstituicao: 0,
        codCentroCusto: null,
        ativo: true,
        exigeProntuario: false,
        localConferencia: false,
        ultimaAlteracao: null,
        tstamp: '',
        centroCusto: null,
      );

  String GetDropDownText() => nome == null ? '' : nome;

  List<DropDownFilterModel<LocalInstituicaoModel>> GetDropDownFilters(
          String filter) =>
      [
        DropDownFilterModel(
          (object) =>
              object.nome != null &&
              object.nome.toUpperCase().endsWith(filter.toUpperCase()),
        ),
        DropDownFilterModel(
          (object) =>
              object.nome == null ||
              object.nome.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String LocalInstituicaoText() => '${nome == null ? '' : nome}';
}
