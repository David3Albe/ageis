import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_manutencao_model.freezed.dart';
part 'equipamento_manutencao_model.g.dart';

@unfreezed
abstract class EquipamentoManutencaoModel with _$EquipamentoManutencaoModel {
  const EquipamentoManutencaoModel._();

  factory EquipamentoManutencaoModel({
    required int? cod,
    required int? codEquipamento,
    required int? codServicosTipo,
    required String? resultado,
    required String? descricao,
    required DateTime? dataInicio,
    required DateTime? dataTermino,
    required DateTime? dataParada,
    required String? imagemDoAnexo,
    required int? codUsuario,
    required int? codInstituicao,
    required String? tecnico,
    required String? usuarioRegistro,
    required DateTime? dataRegistro,
    required String? numNF,
    required String? problema,
    required String? detectadoPor,
    required int? codPeca1,
    required int? codPeca2,
    required int? codPeca3,
    required int? codPeca4,
    required int? codPeca5,
    required double? qtde1,
    required double? qtde2,
    required double? qtde3,
    required double? qtde4,
    required double? qtde5,
    required double? valor1,
    required double? valor2,
    required double? valor3,
    required double? valor4,
    required double? valor5,
    required DateTime? garantia1,
    required DateTime? garantia2,
    required DateTime? garantia3,
    required DateTime? garantia4,
    required DateTime? garantia5,
    required String? serie1,
    required String? serie2,
    required String? serie3,
    required String? serie4,
    required String? serie5,
    required String? nfAnexa,
    required String? nfAnexaNome,
    required DateTime? validade,
    required bool? controlarValidade,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
    required EquipamentoModel? equipamento,
    required ServicoTipoModel? servicoTipo,
    required UsuarioModel? usuario,
    required PecaModel? peca,
    required PecaModel? peca1,
    required PecaModel? peca2,
    required PecaModel? peca3,
    required PecaModel? peca4,
    required PecaModel? peca5,
    UsuarioDropDownSearchResponseDTO? usuarioDetectadoPor,
    UsuarioDropDownSearchResponseDTO? usuarioTecnico,
  }) = _EquipamentoManutencaoModel;

  factory EquipamentoManutencaoModel.fromJson(Map<String, Object?> json) =>
      _$EquipamentoManutencaoModelFromJson(json);

  static EquipamentoManutencaoModel copy(
          EquipamentoManutencaoModel equipamentoManutencao) =>
      EquipamentoManutencaoModel.fromJson(equipamentoManutencao.toJson());

  factory EquipamentoManutencaoModel.empty() => EquipamentoManutencaoModel(
        cod: 0,
        codEquipamento: 0,
        codServicosTipo: 0,
        resultado: '',
        descricao: '',
        dataInicio: DateTime.now(),
        dataTermino: null,
        dataParada: null,
        imagemDoAnexo: null,
        codUsuario: 0,
        codInstituicao: 0,
        tecnico: null,
        usuarioRegistro: null,
        dataRegistro: DateTime.now(),
        numNF: '',
        problema: null,
        detectadoPor: null,
        codPeca1: null,
        codPeca2: null,
        codPeca3: null,
        codPeca4: null,
        codPeca5: null,
        qtde1: null,
        qtde2: null,
        qtde3: null,
        qtde4: null,
        qtde5: null,
        valor1: null,
        valor2: null,
        valor3: null,
        valor4: null,
        valor5: null,
        garantia1: null,
        garantia2: null,
        garantia3: null,
        garantia4: null,
        garantia5: null,
        serie1: null,
        serie2: null,
        serie3: null,
        serie4: null,
        serie5: null,
        nfAnexa: null,
        nfAnexaNome: null,
        validade: null,
        controlarValidade: false,
        ultimaAlteracao: null,
        tstamp: '',
        equipamento: null,
        servicoTipo: null,
        usuario: null,
        peca: null,
        peca1: null,
        peca2: null,
        peca3: null,
        peca4: null,
        peca5: null,
      );

  String get getResultText => resultado == null
      ? ''
      : EquipamentoManutencaoResultOption.getOpcaoFromId(resultado!);
}

class EquipamentoManutencaoResultOption with DropDownText {
  final String text;
  final String cod;

  EquipamentoManutencaoResultOption(this.text, this.cod);

  static final List<EquipamentoManutencaoResultOption> resultOptions = [
    EquipamentoManutencaoResultOption('Bloqueado', '0'),
    EquipamentoManutencaoResultOption('Liberado', '1'),
    EquipamentoManutencaoResultOption('Liberado com Restrições', '2'),
  ];

  static String getOpcaoFromId(String opcao) {
    Iterable<EquipamentoManutencaoResultOption>? result =
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
