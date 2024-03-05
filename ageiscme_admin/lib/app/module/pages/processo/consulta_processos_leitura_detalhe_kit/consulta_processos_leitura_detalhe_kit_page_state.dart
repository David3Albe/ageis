import 'package:ageiscme_data/query_services/processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_detalhe_kit/consulta_processos_leitura_detalhe_kit_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosLeituraDetalheKitPageCubit
    extends Cubit<ConsultaProcessosLeituraDetalheKitPageState> {
  final ConsultaProcessosLeituraDetalheKitService service;
  ConsultaProcessosLeituraDetalheKitPageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraDetalheKitPageState(
            processosLeituras: [],
            loading: false,
          ),
        );

  void loadProcessoLeituraDetalheKit(
    ConsultaProcessosLeituraDetalheKitFilter filter,
  ) async {
    emit(
      ConsultaProcessosLeituraDetalheKitPageState(
        loading: true,
        processosLeituras: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosLeituraDetalheKitModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosLeituraDetalheKitModel> processosLeituras =
          itens.$2;
      emit(
        ConsultaProcessosLeituraDetalheKitPageState(
          loading: false,
          processosLeituras: processosLeituras,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraDetalheKitPageState(
          loading: false,
          processosLeituras: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraDetalheKitPageState {
  final bool loading;
  final List<ConsultaProcessosLeituraDetalheKitModel> processosLeituras;
  final String error;
  final String message;

  ConsultaProcessosLeituraDetalheKitPageState({
    required this.loading,
    required this.processosLeituras,
    this.error = '',
    this.message = '',
  });
}
