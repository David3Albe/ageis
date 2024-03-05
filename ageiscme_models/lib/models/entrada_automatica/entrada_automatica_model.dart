import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/models/processo_leitura/processo_leitura_model.dart';
import 'package:ageiscme_models/models/processo_registro/processo_registro_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entrada_automatica_model.freezed.dart';
part 'entrada_automatica_model.g.dart';

@unfreezed
abstract class EntradaAutomaticaModel with _$EntradaAutomaticaModel {
  const EntradaAutomaticaModel._();

  factory EntradaAutomaticaModel({
    required int? cod,
    required int? codRegistroProcesso,
    required int? codUsuario,
    required int? situacao,
    required String? observacao,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    required DateTime? DataHora,
    required int? codEtapa,
    required int? codProcessoLeitura,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required ProcessoRegistroModel? processoRegistro,
    required UsuarioModel? usuario,
    required ProcessoLeituraModel? processoLeitura,
    required ProcessoEtapaModel? processoEtapa,
  }) = _EntradaAutomaticaModel;

  factory EntradaAutomaticaModel.fromJson(Map<String, Object?> json) =>
      _$EntradaAutomaticaModelFromJson(json);

  static EntradaAutomaticaModel copy(EntradaAutomaticaModel entradaAutomatica) {
    return EntradaAutomaticaModel.fromJson(entradaAutomatica.toJson());
  }

  factory EntradaAutomaticaModel.empty() => EntradaAutomaticaModel(
        DataHora: null,
        cod: 0,
        codEtapa: null,
        codInstituicao: 0,
        codProcessoLeitura: null,
        codRegistroProcesso: null,
        codUsuario: null,
        observacao: null,
        situacao: null,
        ultimaAlteracao: null,
        tstamp: '',
        processoRegistro: null,
        processoEtapa: null,
        processoLeitura: null,
        usuario: null,
      );
}
