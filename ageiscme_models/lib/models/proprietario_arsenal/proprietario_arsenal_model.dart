import 'package:ageiscme_models/models/proprietario/proprietario_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'proprietario_arsenal_model.freezed.dart';
part 'proprietario_arsenal_model.g.dart';

@unfreezed
abstract class ProprietarioArsenalModel with _$ProprietarioArsenalModel {
  factory ProprietarioArsenalModel({
    required int? cod,
    required int? codProprietario,
    required int? codEstoque,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required ProprietarioModel? proprietario,
  }) = _ProprietarioArsenalModel;

  factory ProprietarioArsenalModel.fromJson(Map<String, Object?> json) =>
      _$ProprietarioArsenalModelFromJson(json);

  static ProprietarioArsenalModel copy(
          ProprietarioArsenalModel proprietarioArsenal) =>
      ProprietarioArsenalModel.fromJson(proprietarioArsenal.toJson());

  factory ProprietarioArsenalModel.empty() => ProprietarioArsenalModel(
        cod: 0,
        codProprietario: 0,
        codEstoque: 0,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
        proprietario: null,
      );
}
