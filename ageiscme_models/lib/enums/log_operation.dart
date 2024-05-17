import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum LogOperation {
  @JsonValue(1)
  LoginAdministracao,
  @JsonValue(2)
  LoginProcesso,
  @JsonValue(902)
  ProcessoOperacao_Quebra_Sequencia_Autorizada,
  @JsonValue(903)
  ProcessoOperacao_Quebra_Sequencia_Nao_Autorizada,
  @JsonValue(904)
  ProcessoOperacao_Kit_DataMatrixDanificado_Autorizado,
  @JsonValue(10000)
  Insercao,
  @JsonValue(10001)
  Alteracao,
  @JsonValue(10002)
  Remocao,
  @JsonValue(10003)
  Erro,
  @JsonValue(10004)
  TentativaLeituraDecisaoProcessoNaoAutorizada,
}
