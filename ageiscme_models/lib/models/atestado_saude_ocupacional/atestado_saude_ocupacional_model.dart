import 'package:ageiscme_models/models/usuario/usuario_model.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'atestado_saude_ocupacional_model.freezed.dart';
part 'atestado_saude_ocupacional_model.g.dart';

@unfreezed
abstract class AtestadoSaudeOcupacionalModel
    with _$AtestadoSaudeOcupacionalModel {
  const AtestadoSaudeOcupacionalModel._();

  factory AtestadoSaudeOcupacionalModel({
    required int? cod,
    required String? nomeMedico,
    required int? crmMedico,
    required int? codUsuario,
    required int? tipo,
    required int? conclusao,
    required DateTime? data,
    required DateTime? validade,
    required int? codInstituicao,
    required String? doc,
    required String? anexo,
    required String? docNome,
    required bool? controlarValidade,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required UsuarioModel? usuario,
  }) = _AtestadoSaudeOcupacionalModel;

  factory AtestadoSaudeOcupacionalModel.fromJson(Map<String, Object?> json) =>
      _$AtestadoSaudeOcupacionalModelFromJson(json);

  static AtestadoSaudeOcupacionalModel copy(
          AtestadoSaudeOcupacionalModel atestadoSaudeOcupacional) =>
      AtestadoSaudeOcupacionalModel.fromJson(atestadoSaudeOcupacional.toJson());

  factory AtestadoSaudeOcupacionalModel.empty() =>
      AtestadoSaudeOcupacionalModel(
        cod: 0,
        nomeMedico: null,
        crmMedico: null,
        codUsuario: null,
        tipo: null,
        conclusao: null,
        data: null,
        validade: null,
        doc: null,
        docNome: null ,
        anexo: null,
        controlarValidade: false,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
        usuario: null,
      );

  String get GetTipoAsoText => tipo == null
      ? ''
      : AtestadoSaudeOcupacionalTipoAsoOption.getTipoAsoOpcaoFromId(tipo!);

  String get GetConclusaoText => conclusao == null
      ? ''
      : AtestadoSaudeOcupacionalConclusaoOption.getConclusaoOpcaoFromId(
          conclusao!);
}

class AtestadoSaudeOcupacionalTipoAsoOption with DropDownText {
  final String text;
  final int cod;

  AtestadoSaudeOcupacionalTipoAsoOption(this.text, this.cod);

  static final List<AtestadoSaudeOcupacionalTipoAsoOption> tipoAsoOptions = [
    AtestadoSaudeOcupacionalTipoAsoOption('Admissional', 0),
    AtestadoSaudeOcupacionalTipoAsoOption('Periódico', 1),
    AtestadoSaudeOcupacionalTipoAsoOption('Demissional', 2),
    AtestadoSaudeOcupacionalTipoAsoOption('Retorno ao Trabalho', 3),
    AtestadoSaudeOcupacionalTipoAsoOption('Troca de Função', 4),
  ];

  static String getTipoAsoOpcaoFromId(int opcao) {
    Iterable<AtestadoSaudeOcupacionalTipoAsoOption>? tipoAso =
        tipoAsoOptions.where((element) => element.cod == opcao);

    if (tipoAso.isEmpty) {
      return '';
    } else {
      return tipoAso.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}

class AtestadoSaudeOcupacionalConclusaoOption with DropDownText {
  final String text;
  final int cod;

  AtestadoSaudeOcupacionalConclusaoOption(this.text, this.cod);

  static final List<AtestadoSaudeOcupacionalConclusaoOption> conclusaoOptions =
      [
    AtestadoSaudeOcupacionalConclusaoOption('Apto', 0),
    AtestadoSaudeOcupacionalConclusaoOption('Inapto', 1),
  ];

  static String getConclusaoOpcaoFromId(int opcao) {
    Iterable<AtestadoSaudeOcupacionalConclusaoOption>? conclusao =
        conclusaoOptions.where((element) => element.cod == opcao);

    if (conclusao.isEmpty) {
      return '';
    } else {
      return conclusao.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
