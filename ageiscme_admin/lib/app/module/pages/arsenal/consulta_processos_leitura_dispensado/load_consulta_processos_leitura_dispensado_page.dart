import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/local_instituicao/local_instituicao_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_dispensado/consulta_processos_leitura_dispensado_page.dart';
import 'package:ageiscme_admin/app/module/pages/arsenal/consulta_processos_leitura_dispensado/consulta_processos_leitura_dispensado_page_state.dart';
import 'package:ageiscme_data/query_services/processo_leitura_dispensado/consulta_processo_leitura_dispensado_service.dart';
import 'package:ageiscme_models/filters/item/item_filter.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_dispensado/consulta_processos_leitura_dispensado_filter.dart';
import 'package:compartilhados/componentes/columns/custom_data_column.dart';
import 'package:compartilhados/enums/custom_data_column_type.dart';
import 'package:flutter/material.dart';

class LoadConsultaProcessosLeituraDispensadoPage extends StatefulWidget {
  LoadConsultaProcessosLeituraDispensadoPage({super.key});

  @override
  State<LoadConsultaProcessosLeituraDispensadoPage> createState() =>
      _LoadConsultaProcessosLeituraDispensadoPageState();
}

class _LoadConsultaProcessosLeituraDispensadoPageState
    extends State<LoadConsultaProcessosLeituraDispensadoPage> {
  late final List<CustomDataColumn> colunas;

  late final ConsultaProcessosLeituraDispensadoPageCubit bloc;
  late final LocalInstituicaoCubit localInstituicaoBloc;
  late final ConsultaProcessosLeituraDispensadoFilter filter;

  @override
  void dispose() {
    localInstituicaoBloc.close();
    bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    bloc = ConsultaProcessosLeituraDispensadoPageCubit(
      service: ConsultaProcessoLeituraDispensadoService(),
    );
    filter = ConsultaProcessosLeituraDispensadoFilter.empty();
    filter.startDate = DateTime.now().add(const Duration(days: -1));
    filter.finalDate = DateTime.now();
    localInstituicaoBloc = LocalInstituicaoCubit();
    localInstituicaoBloc.loadAll();

    colunas = [
      CustomDataColumn(
        text: 'Data',
        field: 'dataHora',
        type: CustomDataColumnType.DateTime,
      ),
      CustomDataColumn(
        text: 'Cod. Kit',
        field: 'codKit',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(text: 'Kit', field: 'kitDescritorNome'),
      CustomDataColumn(text: 'Tamanho Kit', field: 'tamanhoKit'),
      CustomDataColumn(
        text: 'Valor Peso Kit',
        field: 'valorPesoKit',
        valueConverter: (value) => value == ' - ' ? '' : value,
      ),
      CustomDataColumn(
        text: 'Itens Pendente',
        field: 'nroItensFaltantes',
        type: CustomDataColumnType.Number,
      ),
      CustomDataColumn(text: 'ID Item', field: 'idEtiqueta'),
      CustomDataColumn(text: 'Item', field: 'descricaoItem'),
      CustomDataColumn(text: 'Proprietário', field: 'proprietario'),
      CustomDataColumn(text: 'Tamanho Item', field: 'tamanhoItem'),
      CustomDataColumn(
        text: 'Valor Peso Item',
        field: 'valorPesoItem',
        valueConverter: (value) => value == ' - ' ? '' : value,
      ),
      CustomDataColumn(text: 'Grupo', field: 'nomeGrupo'),
      CustomDataColumn(text: 'Entrada/Saída', field: 'entradaSaida'),
      CustomDataColumn(text: 'Etapa Processo', field: 'nomeEtapaProcesso'),
      CustomDataColumn(text: 'Processo Tipo', field: 'nomeProcessoTipo'),
      CustomDataColumn(text: 'Usuário', field: 'nomeUsuario'),
      CustomDataColumn(text: 'Prontuário', field: 'prontuarioRetirada'),
      CustomDataColumn(text: 'Origem', field: 'origem'),
      CustomDataColumn(text: 'Destino', field: 'destino'),
      CustomDataColumn(text: 'Circulante', field: 'circulante'),
      CustomDataColumn(
        text: 'Data Validade',
        field: 'dataValidade',
        type: CustomDataColumnType.DateTime,
      ),
      CustomDataColumn(
        text: 'Registro Processo',
        field: 'codRegistroProcesso',
        type: CustomDataColumnType.Number,
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConsultaProcessosLeituraDispensadoPage(
      bloc: bloc,
      colunas: colunas,
      filter: filter,
      itemFilter: ItemFilter(),
      localInstituicaoBloc: localInstituicaoBloc,
    );
  }
}
