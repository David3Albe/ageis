import 'package:ageiscme_admin/app/module/pages/processo/cancelamento_preparo/cubits/selected_cubit.dart';
import 'package:ageiscme_models/dto/chave_valor/chave_valor_dto.dart';
import 'package:ageiscme_models/response_dto/processo_leitura_cancelamento_preparo/search/leitura/processo_leitura_cancelamento_preparo_search_leitura_response_dto.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/componentes/grids/pluto_grid/pluto_grid_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class LeituraSelecionadaWidget extends StatelessWidget {
  const LeituraSelecionadaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO? leitura =
        context.watch<SelectedCubit>().state.leitura;
    return PlutoGridWidget<ChaveValorDTO>(
      columns: [
        CustomDataColumn(
          text: 'Campo',
          field: 'chave',
        ),
        CustomDataColumn(
          text: 'Valor',
          field: 'valor',
        ),
      ],
      items: getItens(leitura),
    );
  }

  List<ChaveValorDTO> getItens(ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO? leitura) {
    if (leitura == null) return [];
    DateFormat format = DateFormat('dd/MM/yyyy HH:mm');
    return [
      ChaveValorDTO(
        chave: 'Cód. Leitura',
        valor: leitura.codProcessoLeitura.toString(),
      ),
      ChaveValorDTO(
        chave: 'Data Hora',
        valor: leitura.dataHora != null ? format.format(leitura.dataHora!) : '',
      ),
      ChaveValorDTO(
        chave: 'Etapa',
        valor: leitura.nomeEtapa ?? '',
      ),
      if (leitura.codItem != null) ...{
        ChaveValorDTO(
          chave: 'Etiqueta Item',
          valor: leitura.codBarraItem ?? '',
        ),
        ChaveValorDTO(chave: 'Descritor Item', valor: leitura.nomeItem ?? ''),
      },
      if (leitura.codKit != null) ...{
        ChaveValorDTO(chave: 'Cód Barra Kit', valor: leitura.codBarraKit ?? ''),
        ChaveValorDTO(chave: 'Descritor Kit', valor: leitura.nomeKit ?? ''),
      },
      if (leitura.nomeEmbalagem != null) ...{
        ChaveValorDTO(chave: 'Embalagem', valor: leitura.nomeEmbalagem ?? ''),
      },
      if (leitura.nomeUsuario != null) ...{
        ChaveValorDTO(chave: 'Usuário', valor: leitura.nomeUsuario ?? ''),
      },
    ];
  }
}
