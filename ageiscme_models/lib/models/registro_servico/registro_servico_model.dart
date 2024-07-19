import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'registro_servico_model.freezed.dart';
part 'registro_servico_model.g.dart';

@unfreezed
abstract class RegistroServicoModel with _$RegistroServicoModel {
  const RegistroServicoModel._();

  factory RegistroServicoModel({
    int? cod,
    String? indicador,
    String? resultado,
    String? descricao,
    String? restricao,
    String? usuarioRegistro,
    String? lote,
    String? tecnico,
    String? imagemDocAnexo,
    String? motivoLiberacao,
    DateTime? dataEnvio,
    DateTime? dataRetorno,
    DateTime? dataInicio,
    DateTime? dataTermino,
    DateTime? dataValidade,
    DateTime? dataLiberacao,
    DateTime? dataRegistro,
    int? codUsuario,
    int? codEquipamento,
    int? codItem,
    int? codEstoque,
    int? codUsuarioLiberado,
    int? codServicosTipos,
    int? codInstituicao,
    double? temperatura,
    double? umidade,
    double? temperaturaMax,
    double? temperaturaMin,
    double? umidadeMax,
    double? umidadeMin,
    String? docAnexa,
    String? docAnexaNome,
    bool? controlarValidade,
    DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') String? tstamp,
    EquipamentoModel? equipamento,
    ItemModel? item,
    ServicoTipoModel? servicoTipo,
    UsuarioModel? usuario,
    UsuarioDropDownSearchResponseDTO? usuarioDropDown,
  }) = _RegistroServicoModel;

  factory RegistroServicoModel.fromJson(Map<String, Object?> json) =>
      _$RegistroServicoModelFromJson(json);

  static RegistroServicoModel copy(RegistroServicoModel registroServico) =>
      RegistroServicoModel.fromJson(registroServico.toJson());

  factory RegistroServicoModel.empty() => RegistroServicoModel(
        cod: 0,
        indicador: null,
        resultado: null,
        descricao: null,
        restricao: null,
        usuarioRegistro: null,
        lote: null,
        tecnico: null,
        imagemDocAnexo: null,
        motivoLiberacao: null,
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

  static RegistroServicoResultOption getLiberado() {
    return RegistroServicoResultOption('Liberado', '1');
  }

  @override
  String GetDropDownText() => text;
}
