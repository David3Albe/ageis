import 'package:ageiscme_models/models/tipo_afastamento/tipo_afastamento_model.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'afastamento_model.freezed.dart';
part 'afastamento_model.g.dart';

@unfreezed
abstract class AfastamentoModel with _$AfastamentoModel {
  const AfastamentoModel._();

  factory AfastamentoModel({
    required int cod,
    required bool catSemAfastamento,
    int? codTipoAfastamento,
    int? codUsuario,
    int? codUsuarioRegistro,
    DateTime? dataRegistro,
    DateTime? dataInicio,
    int? diasAfastamento,
    int? horasAfastamento,
    String? numeroCat,
    String? tipoCat,
    String? catAnexa,
    String? docAnexo,
    int? codInstituicao,
    DateTime? ultimaAlteracao,
    String? tstamp,
    UsuarioDropDownSearchResponseDTO? usuario,
    UsuarioDropDownSearchResponseDTO? usuarioRegistro,
    TipoAfastamentoModel? tipoAfastamento,
  }) = _AfastamentoModel;

  factory AfastamentoModel.fromJson(Map<String, Object?> json) =>
      _$AfastamentoModelFromJson(json);

  static AfastamentoModel copy(AfastamentoModel afastamento) =>
      AfastamentoModel.fromJson(afastamento.toJson());

  factory AfastamentoModel.empty() => AfastamentoModel(
        catSemAfastamento: false,
        cod: 0,
      );
}

class TipoCatOption with DropDownText {
  final String text;
  final String cod;

  TipoCatOption(this.text, this.cod);

  static final List<TipoCatOption> cats = [
    TipoCatOption('Inicial', '0'),
    TipoCatOption('Reabertura', '1'),
    TipoCatOption('Óbito', '2'),
  ];

  static String getTipoCatFromOpcao(String opcao) {
    Iterable<TipoCatOption>? cat =
        cats.where((element) => element.cod == opcao);

    if (cat.isEmpty) {
      return '';
    } else {
      return cat.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
