import 'package:ageiscme_models/models/proprietario/proprietario_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'proprietario_local_model.freezed.dart';
part 'proprietario_local_model.g.dart';

@unfreezed
abstract class ProprietarioLocalModel with _$ProprietarioLocalModel {
  factory ProprietarioLocalModel({
    required int? cod,
    required int? codProprietario,
    required int? codLocal,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required ProprietarioModel? proprietario,
  }) = _ProprietarioLocalModel;

  factory ProprietarioLocalModel.fromJson(Map<String, Object?> json) =>
      _$ProprietarioLocalModelFromJson(json);

  static ProprietarioLocalModel copy(
          ProprietarioLocalModel proprietarioLocal) =>
      ProprietarioLocalModel.fromJson(proprietarioLocal.toJson());

  factory ProprietarioLocalModel.empty() => ProprietarioLocalModel(
        cod: 0,
        codProprietario: 0,
        codLocal: 0,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
        proprietario: null,
      );
}
