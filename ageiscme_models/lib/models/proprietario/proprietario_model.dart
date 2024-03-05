import 'package:ageiscme_models/models/proprietario_arsenal/proprietario_arsenal_model.dart';
import 'package:ageiscme_models/models/proprietario_local/proprietario_local_model.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_mixin.dart';
import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'proprietario_model.freezed.dart';
part 'proprietario_model.g.dart';

@unfreezed
abstract class ProprietarioModel
    with
        _$ProprietarioModel,
        DropDownText,
        DropDownFilterMixin<ProprietarioModel> {
  const ProprietarioModel._();

  factory ProprietarioModel({
    required int? cod,
    required String? nome,
    required String? contato,
    required int? codBarra,
    required bool? manutencaoLiberada,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required List<ProprietarioLocalModel>? proprietariosLocais,
    required List<ProprietarioArsenalModel>? proprietariosArsenais,
  }) = _ProprietarioModel;

  factory ProprietarioModel.fromJson(Map<String, Object?> json) =>
      _$ProprietarioModelFromJson(json);

  static ProprietarioModel copy(ProprietarioModel proprietario) {
    return ProprietarioModel.fromJson(proprietario.toJson());
  }

  factory ProprietarioModel.empty() => ProprietarioModel(
        cod: 0,
        nome: '',
        contato: '',
        codBarra: null,
        manutencaoLiberada: false,
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
        proprietariosLocais: [],
        proprietariosArsenais: [],
      );

  String GetDropDownText() => nome == null ? '' : nome!;

  List<DropDownFilterModel<ProprietarioModel>> GetDropDownFilters(
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

  String ProprietarioText() => '($cod) ${nome == null ? '' : nome!}';
}
