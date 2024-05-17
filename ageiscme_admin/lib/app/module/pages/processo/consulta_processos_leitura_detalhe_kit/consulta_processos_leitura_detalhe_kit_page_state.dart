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
            kit: null,
            loading: false,
          ),
        );

  void loadProcessoLeituraDetalheKit(
    ConsultaProcessosLeituraDetalheKitFilter filter,
  ) async {
    emit(
      ConsultaProcessosLeituraDetalheKitPageState(
        loading: true,
        kit: null,
      ),
    );
    try {
      (String, ConsultaProcessosLeituraDetalheKitModel)? result =
          await service.filter(
        filter,
      );
      if (result == null) return;

      emit(
        ConsultaProcessosLeituraDetalheKitPageState(
          loading: false,
          kit: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraDetalheKitPageState(
          loading: false,
          kit: null,
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraDetalheKitPageState {
  final bool loading;
  final ConsultaProcessosLeituraDetalheKitModel? kit;
  final String error;
  final String message;

  ConsultaProcessosLeituraDetalheKitPageState({
    required this.loading,
    required this.kit,
    this.error = '',
    this.message = '',
  });
}
