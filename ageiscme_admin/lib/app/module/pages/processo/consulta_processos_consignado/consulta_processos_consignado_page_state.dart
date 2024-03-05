import 'package:ageiscme_data/query_services/processos_consignado/consulta_processos_consignado_service.dart';
import 'package:ageiscme_models/query_filters/processos_consignado/consulta_processos_consignado_filter.dart';
import 'package:ageiscme_models/query_models/processos_consignado/consulta_processos_consignado_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaProcessosConsignadoPageCubit
    extends Cubit<ConsultaProcessosConsignadoPageState> {
  final ConsultaProcessosConsignadoService service;
  ConsultaProcessosConsignadoPageCubit({required this.service})
      : super(
          ConsultaProcessosConsignadoPageState(
            itensConsignados: [],
            loading: false,
          ),
        );

  void loadProcessosConsignado(ConsultaProcessosConsignadoFilter filter) async {
    emit(
      ConsultaProcessosConsignadoPageState(
        loading: true,
        itensConsignados: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosConsignadoModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosConsignadoModel> itensConsignados = itens.$2;
      emit(
        ConsultaProcessosConsignadoPageState(
          loading: false,
          itensConsignados: itensConsignados,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosConsignadoPageState(
          loading: false,
          itensConsignados: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosConsignadoPageState {
  final bool loading;
  final List<ConsultaProcessosConsignadoModel> itensConsignados;
  final String error;
  final String message;

  ConsultaProcessosConsignadoPageState({
    required this.loading,
    required this.itensConsignados,
    this.error = '',
    this.message = '',
  });
}
