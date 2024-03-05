import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_manutencao_model.g.dart';
part 'consulta_manutencao_model.freezed.dart';

@unfreezed
sealed class ConsultaManutencaoModel with _$ConsultaManutencaoModel {
  const ConsultaManutencaoModel._();

  factory ConsultaManutencaoModel({
    required int? cod,
    required DateTime? dataInicio,
    required String? descricao,
    required double? qtde,
    required double? valor,
    required String? serie,
    required DateTime? garantia,
    required DateTime? dataTermino,
    required DateTime? dataParada,
    required DateTime? dataRegistro,
    required String? numNF,
    required String? problema,
    required String? resultado,
    required String? peca,
    required EquipamentoModel? equipamento,
    required ServicoTipoModel? servicoTipo,
    required UsuarioModel? usuario,
  }) = _ConsultaManutencaoModel;

  factory ConsultaManutencaoModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaManutencaoModelFromJson(json);

  static ConsultaManutencaoModel copy(ConsultaManutencaoModel obj) {
    return ConsultaManutencaoModel.fromJson(obj.toJson());
  }
}
