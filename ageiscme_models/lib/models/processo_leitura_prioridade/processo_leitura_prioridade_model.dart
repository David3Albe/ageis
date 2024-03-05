import 'package:compartilhados/exceptions/custom_base_exception.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';

class ProcessoLeituraPrioridadeModel with DropDownText {
  String descricao;

  int codigo;

  int codigoProcesso;

  bool urgente;

  ProcessoLeituraPrioridadeModel({
    required this.codigo,
    required this.descricao,
    required this.codigoProcesso,
    this.urgente = false,
  });

  @override
  String GetDropDownText() {
    return descricao;
  }

  static List<ProcessoLeituraPrioridadeModel> getAll() {
    return List<ProcessoLeituraPrioridadeModel>() = [
      ProcessoLeituraPrioridadeModel(
          codigo: 0, descricao: 'Não Definida', codigoProcesso: 0),
      ProcessoLeituraPrioridadeModel(
          codigo: 210, descricao: 'Normal', codigoProcesso: 1),
      ProcessoLeituraPrioridadeModel(
          codigo: 211, descricao: 'Urgente', urgente: true, codigoProcesso: 2),
      ProcessoLeituraPrioridadeModel(
          codigo: 212, descricao: 'Emergência', codigoProcesso: 3),
    ];
  }

  static ProcessoLeituraPrioridadeModel getPriorityFromCode(
      int codPrioriodade) {
    ProcessoLeituraPrioridadeModel? prioridade = getAll()
        .where((element) => element.codigoProcesso == codPrioriodade)
        .firstOrNull;
    if (prioridade == null) {
      throw CustomBaseException('Prioridade Não existe');
    }
    return prioridade;
  }
}
