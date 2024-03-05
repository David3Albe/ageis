import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_kit_model.g.dart';
part 'consulta_kit_model.freezed.dart';

@unfreezed
sealed class ConsultaKitModel with _$ConsultaKitModel {
  const ConsultaKitModel._();

  factory ConsultaKitModel({
    required int? cod,
    required String? codBarra,
    required String? nomeKitDescritor,
    required String? nomeProprietario,
    required String? tamanhoKit,
    required String? grupo,
    required int? qtdeItensFisico,
    required String? nomeCor1,
    required String? nomeCor2,
    required String? nomeCor3,
    required String? nomeCor4,
    required String? nomeConjunto,
    required String? situacao,
    required String? restricao,
    required String? entradaSaida,
    required String? localEntrega,
    required String? localRetirada,
    required String? ultimaEtapa,
    required DateTime? ultimaRevisao,
  }) = _ConsultaKitModel;

  factory ConsultaKitModel.fromJson(Map<String, Object?> json) =>
      _$ConsultaKitModelFromJson(json);

  static ConsultaKitModel copy(ConsultaKitModel obj) {
    return ConsultaKitModel.fromJson(obj.toJson());
  }
}
