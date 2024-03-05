import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'tamanho_model.freezed.dart';
part 'tamanho_model.g.dart';

@unfreezed
abstract class TamanhoModel with _$TamanhoModel, DropDownText {
  const TamanhoModel._();

  factory TamanhoModel({
    required int? cod,
    required int? codInstituicao,
    required String? descricao,
    required int? referencial,
    required String? sigla,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') String? tstamp,
  }) = _TamanhoModel;

  factory TamanhoModel.fromJson(Map<String, Object?> json) =>
      _$TamanhoModelFromJson(json);

  static TamanhoModel copy(TamanhoModel tamanho) {
    return TamanhoModel.fromJson(tamanho.toJson());
  }

  factory TamanhoModel.empty() => TamanhoModel(
        cod: 0,
        descricao: '',
        sigla: '',
        referencial: null,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => sigla == null ? '' : sigla!;
}
