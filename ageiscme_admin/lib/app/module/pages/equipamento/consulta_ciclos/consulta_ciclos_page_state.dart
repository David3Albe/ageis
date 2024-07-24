import 'package:ageiscme_data/query_services/equipamento_ciclos/consulta_ciclos_equipamento_service.dart';
import 'package:ageiscme_models/query_filters/equipamento_ciclo/consulta_equipamento_ciclo_filter.dart';
import 'package:ageiscme_models/query_models/equipamento_ciclos/consulta_ciclos_equipamento_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaCiclosPageCubit extends Cubit<ConsultaCiclosPageState> {
  final ConsultaCiclosEquipamentoService service;
  ConsultaCiclosPageCubit({required this.service})
      : super(
          ConsultaCiclosPageState(
            ciclos: [],
            loading: false,
          ),
        );

  void loadManutencao(ConsultaEquipamentoCicloFilter filter) async {
    emit(
      ConsultaCiclosPageState(
        loading: true,
        ciclos: [],
      ),
    );
    try {
      (String, List<ConsultaCiclosEquipamentoDTO>)? itens = await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaCiclosEquipamentoDTO> ciclos = itens.$2;
      emit(
        ConsultaCiclosPageState(
          loading: false,
          ciclos: ciclos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaCiclosPageState(
          loading: false,
          ciclos: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaCiclosPageState {
  final bool loading;
  final List<ConsultaCiclosEquipamentoDTO> ciclos;
  final String error;
  final String message;

  ConsultaCiclosPageState({
    required this.loading,
    required this.ciclos,
    this.error = '',
    this.message = '',
  });
}
