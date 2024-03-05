import 'package:ageiscme_data/query_services/registro_servico/consulta_registro_servico_service.dart';
import 'package:ageiscme_models/query_filters/registro_servico/consulta_registro_servico_filter.dart';
import 'package:ageiscme_models/query_models/registro_servico/consulta_registro_servico_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaRegistroServicoPageCubit extends Cubit<ConsultaRegistroServicoPageState> {
  final ConsultaRegistroServicoService service;
  ConsultaRegistroServicoPageCubit({required this.service})
      : super(
          ConsultaRegistroServicoPageState(
            registrosServicos: [],
            loading: false,
          ),
        );

  void loadRegistroServico(ConsultaRegistroServicoFilter filter) async {
    emit(
      ConsultaRegistroServicoPageState(
        loading: true,
        registrosServicos: [],
      ),
    );
    try {
      (String, List<ConsultaRegistroServicoModel>)? itens = await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaRegistroServicoModel> registrosServicos = itens.$2;
      emit(
        ConsultaRegistroServicoPageState(
          loading: false,
          registrosServicos: registrosServicos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaRegistroServicoPageState(
          loading: false,
          registrosServicos: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaRegistroServicoPageState {
  final bool loading;
  final List<ConsultaRegistroServicoModel> registrosServicos;
  final String error;
  final String message;

  ConsultaRegistroServicoPageState({
    required this.loading,
    required this.registrosServicos,
    this.error = '',
    this.message = '',
  });
}
