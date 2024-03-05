import 'package:ageiscme_data/query_services/processos_leitura_detalhe/consulta_processos_leitura_detalhe_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_detalhe/consulta_processos_leitura_detalhe_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_detalhe/consulta_processos_leitura_detalhe_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosLeituraDetalhePageCubit
    extends Cubit<ConsultaProcessosLeituraDetalhePageState> {
  final ConsultaProcessosLeituraDetalheService service;
  ConsultaProcessosLeituraDetalhePageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraDetalhePageState(
            processosLeituras: [],
            loading: false,
          ),
        );

  void loadProcessoLeituraDetalhe(
    ConsultaProcessosLeituraDetalheFilter filter,
  ) async {
    emit(
      ConsultaProcessosLeituraDetalhePageState(
        loading: true,
        processosLeituras: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosLeituraDetalheModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosLeituraDetalheModel> processosLeituras = itens.$2;
      emit(
        ConsultaProcessosLeituraDetalhePageState(
          loading: false,
          processosLeituras: processosLeituras,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraDetalhePageState(
          loading: false,
          processosLeituras: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraDetalhePageState {
  final bool loading;
  final List<ConsultaProcessosLeituraDetalheModel> processosLeituras;
  final String error;
  final String message;

  ConsultaProcessosLeituraDetalhePageState({
    required this.loading,
    required this.processosLeituras,
    this.error = '',
    this.message = '',
  });
}
