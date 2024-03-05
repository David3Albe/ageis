import 'package:ageiscme_models/main.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'registro_servico_model.freezed.dart';
part 'registro_servico_model.g.dart';

@unfreezed
abstract class RegistroServicoModel with _$RegistroServicoModel {
  const RegistroServicoModel._();

  factory RegistroServicoModel({
    required int? cod,
    required String? indicador,
    required String? resultado,
    required String? descricao,
    required String? restricao,
    required String? usuarioRegistro,
    required String? lote,
    required String? tecnico,
    required String? imagemDocAnexo,
    required String? motivoLiberacao,
    required DateTime? dataEnvio,
    required DateTime? dataRetorno,
    required DateTime? dataInicio,
    required DateTime? dataTermino,
    required DateTime? dataValidade,
    required DateTime? dataLiberacao,
    required DateTime? dataRegistro,
    required int? codUsuario,
    required int? codEquipamento,
    required int? codItem,
    required int? codEstoque,
    required int? codUsuarioLiberado,
    required int? codServicosTipos,
    required int? codInstituicao,
    required double? temperatura,
    required double? umidade,
    required double? temperaturaMax,
    required double? temperaturaMin,
    required double? umidadeMax,
    required double? umidadeMin,
    required String? docAnexa,
    required String? docAnexaNome,
    required bool? controlarValidade,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required EquipamentoModel? equipamento,
    required ItemModel? item,
    required ServicoTipoModel? servicoTipo,
    required UsuarioModel? usuario,
  }) = _RegistroServicoModel;

  factory RegistroServicoModel.fromJson(Map<String, Object?> json) =>
      _$RegistroServicoModelFromJson(json);

  static RegistroServicoModel copy(RegistroServicoModel registroServico) =>
      RegistroServicoModel.fromJson(registroServico.toJson());

  factory RegistroServicoModel.empty() => RegistroServicoModel(
        cod: 0,
        indicador: '',
        resultado: null,
        descricao: '',
        restricao: '',
        usuarioRegistro: null,
        lote: '',
        tecnico: null,
        imagemDocAnexo: null,
        motivoLiberacao: '',
        dataEnvio: null,
        dataRetorno: null,
        dataLiberacao: null,
        dataInicio: DateTime.now(),
        dataTermino: null,
        dataValidade: null,
        dataRegistro: DateTime.now(),
        codUsuario: 0,
        codEquipamento: null,
        codItem: null,
        codEstoque: null,
        codUsuarioLiberado: null,
        codServicosTipos: 0,
        codInstituicao: 0,
        temperatura: null,
        umidade: null,
        temperaturaMax: null,
        temperaturaMin: null,
        umidadeMax: null,
        umidadeMin: null,
        docAnexa: null,
        docAnexaNome: null,
        controlarValidade: false,
        ultimaAlteracao: null,
        tstamp: '',
        equipamento: null,
        item: null,
        servicoTipo: null,
        usuario: null,
      );

  String get getResultText => resultado == null
      ? ''
      : RegistroServicoResultOption.getOpcaoFromId(resultado!);
}

class RegistroServicoResultOption with DropDownText {
  final String text;
  final String cod;

  RegistroServicoResultOption(this.text, this.cod);

  static final List<RegistroServicoResultOption> resultOptions = [
    RegistroServicoResultOption('Bloqueado', '0'),
    RegistroServicoResultOption('Liberado', '1'),
    RegistroServicoResultOption('Liberado com Restrições', '2'),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<RegistroServicoResultOption>? result =
        resultOptions.where((element) => element.cod.toString() == opcao);

    if (result.isEmpty) {
      return '';
    } else {
      return result.first.text;
    }
  }

  @override
  String GetDropDownText() => text;
}
