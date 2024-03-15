import 'package:compartilhados/mixins/drop_down_filter/drop_down_filter_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'usuario_processo_model.freezed.dart';
part 'usuario_processo_model.g.dart';

@unfreezed
abstract class UsuarioProcessoModel with _$UsuarioProcessoModel {
  const UsuarioProcessoModel._();

  factory UsuarioProcessoModel({
    required int? cod,
    required String? login,
    required String? nome,
    required int? rg,
    required String? docClasse,
    required int? codBarra,
    required int? codBarraTemporario,
    required String? senha,
    required bool? colaborador,
    required String? nomeEmpresa,
    required bool? controleGestao,
    required int? codInstituicao,
    required bool? ativo,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
  }) = _UsuarioProcessoModel;

  factory UsuarioProcessoModel.fromJson(Map<String, Object?> json) =>
      _$UsuarioProcessoModelFromJson(json);

  static UsuarioProcessoModel copy(UsuarioProcessoModel usuario) {
    return UsuarioProcessoModel.fromJson(usuario.toJson());
  }

    String GetDropDownText() => nome == null ? '' : nome!;

  List<DropDownFilterModel<UsuarioProcessoModel>> GetDropDownFilters(String filter) => [
        DropDownFilterModel(
          (object) =>
              object.codBarra != null &&
              object.codBarra.toString().endsWith(filter),
        ),
        DropDownFilterModel(
          (object) =>
              object.nome == null ||
              object.nome!.toUpperCase().contains(filter.toUpperCase()),
        ),
      ];

  String CodBarraNomeText() => '($codBarra) ${nome == null ? '' : nome!}';
}
