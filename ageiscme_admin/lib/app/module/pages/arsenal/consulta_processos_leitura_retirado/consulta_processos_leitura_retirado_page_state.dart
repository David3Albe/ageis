import 'package:ageiscme_data/query_services/processos_leitura_retirado/consulta_processos_leitura_retirado_service.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_retirado/consulta_processos_leitura_retirado_filter.dart';
import 'package:ageiscme_models/query_models/processos_leitura_retirado/consulta_processos_leitura_retirado_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosLeituraRetiradoPageCubit
    extends Cubit<ConsultaProcessosLeituraRetiradoPageState> {
  final ConsultaProcessosLeituraRetiradoService service;
  ConsultaProcessosLeituraRetiradoPageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraRetiradoPageState(
            processosLeiturasRetirados: [],
            loading: false,
          ),
        );

  void loadProcessosLeituraRetirado(
    ConsultaProcessosLeituraRetiradoFilter filter,
  ) async {
    emit(
      ConsultaProcessosLeituraRetiradoPageState(
        loading: true,
        processosLeiturasRetirados: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosLeituraRetiradoModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosLeituraRetiradoModel> processosLeiturasRetirados =
          itens.$2;
      emit(
        ConsultaProcessosLeituraRetiradoPageState(
          loading: false,
          processosLeiturasRetirados: processosLeiturasRetirados,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraRetiradoPageState(
          loading: false,
          processosLeiturasRetirados: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraRetiradoPageState {
  final bool loading;
  final List<ConsultaProcessosLeituraRetiradoModel> processosLeiturasRetirados;
  final String error;
  final String message;

  ConsultaProcessosLeituraRetiradoPageState({
    required this.loading,
    required this.processosLeiturasRetirados,
    this.error = '',
    this.message = '',
  });
}
