import 'package:ageiscme_models/models/treinamento_usuario/treinamento_usuario_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'treinamento_registro_model.freezed.dart';
part 'treinamento_registro_model.g.dart';

@unfreezed
abstract class TreinamentoRegistroModel with _$TreinamentoRegistroModel {
  factory TreinamentoRegistroModel({
    required int? cod,
    required String? nome,
    required String? descricao,
    required String? observacao,
    required DateTime? data,
    required String? entidade,
    required double? cargaHoraria,
    required int? codInstituicao,
    required String? doc,
    required String? docNome,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required List<TreinamentoUsuarioModel>? usuariosTreinamentos,
  }) = _TreinamentoRegistroModel;

  factory TreinamentoRegistroModel.fromJson(Map<String, Object?> json) =>
      _$TreinamentoRegistroModelFromJson(json);

  static TreinamentoRegistroModel copy(
          TreinamentoRegistroModel treinamentoRegistro) =>
      TreinamentoRegistroModel.fromJson(treinamentoRegistro.toJson());

  factory TreinamentoRegistroModel.empty() => TreinamentoRegistroModel(
        cod: 0,
        nome: '',
        descricao: '',
        observacao: '',
        data: null,
        entidade: '',
        cargaHoraria: null,
        codInstituicao: 0,
        doc: null,
        docNome: null,
        ultimaAlteracao: null,
        tstamp: '',
        usuariosTreinamentos: null,
      );
}
