import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conjunto_model.g.dart';
part 'conjunto_model.freezed.dart';

@unfreezed
sealed class ConjuntoModel with _$ConjuntoModel, DropDownText {
  const ConjuntoModel._();

  factory ConjuntoModel({
    required int? cod,
    required String? nome,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _ConjuntoModel;

  factory ConjuntoModel.fromJson(Map<String, Object?> json) =>
      _$ConjuntoModelFromJson(json);

  static ConjuntoModel copy(ConjuntoModel conjunto) {
    return ConjuntoModel.fromJson(conjunto.toJson());
  }

  factory ConjuntoModel.empty() => ConjuntoModel(
        cod: 0,
        nome: '',
        codInstituicao: 0,
        ativo: true,
        ultimaAlteracao: null,
        tstamp: '',
      );

  String GetDropDownText() => nome == null ? '' : nome!;
}
