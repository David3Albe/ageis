import 'package:ageiscme_models/models/anormalidade_tipo/anormalidade_tipo_model.dart';
import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:ageiscme_models/models/processo_etapa/processo_etapa_model.dart';
import 'package:ageiscme_models/models/processo_registro/processo_registro_model.dart';
import 'package:ageiscme_models/models/usuario/usuario_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'anormalidade_model.freezed.dart';
part 'anormalidade_model.g.dart';

@unfreezed
abstract class AnormalidadeModel with _$AnormalidadeModel {
  const AnormalidadeModel._();

  factory AnormalidadeModel({
    required int cod,
    required String descricao,
    required int codUsuario,
    required int codAnormalidadeTipo,
    required DateTime dataHora,
    int? codInstituicao,
    DateTime? ultimaAlteracao,
    String? tstamp,
    int? codItem,
    int? codRegistroProcesso,
    int? codUsuarioLiberacao,
    String? observacaoLiberacao,
    DateTime? dataLiberacao,
    int? codProcessoEtapa,
    ProcessoRegistroModel? processoRegistro,
    ItemModel? item,
    ProcessoEtapaModel? etapa,
    AnormalidadeTipoModel? anormalidadeTipo,
    UsuarioModel? usuario,
    UsuarioModel? usuarioLiberacao,
  }) = _AnormalidadeModel;

  factory AnormalidadeModel.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeModelFromJson(json);

  static AnormalidadeModel copy(AnormalidadeModel obj) =>
      AnormalidadeModel.fromJson(obj.toJson());
}
