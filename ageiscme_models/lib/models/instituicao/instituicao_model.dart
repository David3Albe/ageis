import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'instituicao_model.freezed.dart';
part 'instituicao_model.g.dart';

@unfreezed
abstract class InstituicaoModel with _$InstituicaoModel {
  const InstituicaoModel._();

  factory InstituicaoModel({
    required int? cod,
    required String? nome,
    required String? endereco,
    required String? cnpj,
    required String? responsavel,
    required String? foneResponsavel,
    required String? foneCme,
    required bool? ativo,
    required bool? imprimeQrCode,
    required int? debugLevel,
    required bool? calculadoraRotulados,
    required bool? fluxoAlternado,
    required bool? embalagemKit,
    required bool? embalagemItem,
    required bool? naoAlertarKitIncompleto,
    required int? tempoMin,
    @JsonKey(name: 'tStamp') required String? tstamp,
    double? escalaFonte,
    int? tempoDescartarItemEstoque,
    String? mensagemDescartarItemEstoque,
    String? mensagemDescartarItemKitEstoque,
    int? tempoDescartarKitEstoque,
    String? mensagemDescartarKitEstoque,
    int? tempoDescartarItemForaEstoque,
    String? mensagemDescartarItemForaEstoque,
    String? mensagemDescartarItemKitForaEstoque,
    int? tempoDescartarKitForaEstoque,
    String? mensagemDescartarKitForaEstoque,
  }) = _InstituicaoModel;

  factory InstituicaoModel.fromJson(Map<String, Object?> json) =>
      _$InstituicaoModelFromJson(json);

  static InstituicaoModel copy(InstituicaoModel instituicao) =>
      InstituicaoModel.fromJson(instituicao.toJson());
}
