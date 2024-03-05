import 'package:compartilhados/exceptions/custom_base_exception.dart';
import 'package:compartilhados/mixins/drop_down_text.dart';

class ProcessoLeituraAcaoModel with DropDownText {
  String descricao;

  int codigo;

  int? codProcessoAcao;

  bool precisaConterLocal;

  ProcessoLeituraAcaoModel(
    this.codigo,
    this.descricao, {
    this.codProcessoAcao,
    this.precisaConterLocal = true,
  });

  @override
  String GetDropDownText() {
    return descricao;
  }

  static List<ProcessoLeituraAcaoModel> getAll() {
    return List<ProcessoLeituraAcaoModel>() = [
      ProcessoLeituraAcaoModel(
        200,
        'Iniciar Entrada',
        codProcessoAcao: 1,
        precisaConterLocal: false,
      ),
      ProcessoLeituraAcaoModel(
        201,
        'Iniciar Saída',
        codProcessoAcao: 2,
        precisaConterLocal: false,
      ),
      ProcessoLeituraAcaoModel(
        202,
        'Finalizar Leitura',
        precisaConterLocal: false,
      ),
      ProcessoLeituraAcaoModel(
        220,
        'Montar Novo Kit',
      ),
      ProcessoLeituraAcaoModel(
        203,
        'Cancelar Leituras',
        precisaConterLocal: false,
      ),
      ProcessoLeituraAcaoModel(
        206,
        'Cancelar 1 Item',
      ),
      ProcessoLeituraAcaoModel(
        204,
        'Sim',
        precisaConterLocal: false,
      ),
      ProcessoLeituraAcaoModel(
        205,
        'Não',
        precisaConterLocal: false,
      ),
      ProcessoLeituraAcaoModel(
        221,
        'Imprimir Etiqueta',
      ),
      ProcessoLeituraAcaoModel(
        222,
        'Trocar Etiqueta',
      ),
      ProcessoLeituraAcaoModel(
        223,
        'Imprimir Indicador',
      ),
      ProcessoLeituraAcaoModel(
        226,
        'Remover Item',
      ),
      ProcessoLeituraAcaoModel(
        225,
        'Repor Item',
      ),
      ProcessoLeituraAcaoModel(
        227,
        'Gerar Etiqueta',
        precisaConterLocal: false,
      ),
      ProcessoLeituraAcaoModel(
        228,
        'Cadastrar Consignado',
        precisaConterLocal: false,
      ),
      ProcessoLeituraAcaoModel(
        229,
        'Transferir',
        precisaConterLocal: false,
      ),
      ProcessoLeituraAcaoModel(
        230,
        'Receber',
        precisaConterLocal: false,
      ),
      ProcessoLeituraAcaoModel(
        231,
        'Zoom',
        precisaConterLocal: false,
      ),
      ProcessoLeituraAcaoModel(
        302,
        'Montar Conjunto',
      ),
      ProcessoLeituraAcaoModel(
        303,
        'Desmontar Conjunto',
      ),
    ];
  }

  static ProcessoLeituraAcaoModel getActionFromCode(int codAcao) {
    ProcessoLeituraAcaoModel? acao = getAll()
        .where((element) => element.codProcessoAcao == codAcao)
        .firstOrNull;
    if (acao == null) {
      throw CustomBaseException('Ação não existe');
    }
    return acao;
  }

  static ProcessoLeituraAcaoModel getActionFromCodeBase(int baseCode) {
    ProcessoLeituraAcaoModel? acao = getAll()
        .where(
          (element) => element.codigo == baseCode,
        )
        .firstOrNull;
    if (acao == null) throw CustomBaseException('Ação não existe');
    return acao;
  }

  static const zoomCode = 231;
}
