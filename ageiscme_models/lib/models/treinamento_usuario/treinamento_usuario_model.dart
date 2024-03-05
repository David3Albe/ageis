import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'treinamento_usuario_model.freezed.dart';
part 'treinamento_usuario_model.g.dart';

@unfreezed
abstract class TreinamentoUsuarioModel with _$TreinamentoUsuarioModel {
  factory TreinamentoUsuarioModel({
    required int? cod,
    required int? codRegistroTreinamento,
    required int? codUsuario,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _TreinamentoUsuarioModel;

  factory TreinamentoUsuarioModel.fromJson(Map<String, Object?> json) =>
      _$TreinamentoUsuarioModelFromJson(json);

  static TreinamentoUsuarioModel copy(
          TreinamentoUsuarioModel treinamentoUsuario) =>
      TreinamentoUsuarioModel.fromJson(treinamentoUsuario.toJson());

  factory TreinamentoUsuarioModel.empty() => TreinamentoUsuarioModel(
        cod: 0,
        codRegistroTreinamento: 0,
        codUsuario: 0,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
      );
}
