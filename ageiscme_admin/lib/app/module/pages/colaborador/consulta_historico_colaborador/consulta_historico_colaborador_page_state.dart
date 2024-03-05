import 'package:ageiscme_data/query_services/historico_colaborador/consulta_historico_colaborador_service.dart';
import 'package:ageiscme_models/query_filters/historico_colaborador/consulta_historico_colaborador_filter.dart';
import 'package:ageiscme_models/query_models/historico_colaborador/consulta_historico_colaborador_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaHistoricoColaboradorPageCubit
    extends Cubit<ConsultaHistoricoColaboradorPageState> {
  final ConsultaHistoricoColaboradorService service;
  ConsultaHistoricoColaboradorPageCubit({required this.service})
      : super(
          ConsultaHistoricoColaboradorPageState(
            historicosColaboradores: [],
            loading: false,
          ),
        );

  void loadHistoricoColaborador(
      ConsultaHistoricoColaboradorFilter filter,) async {
    emit(
      ConsultaHistoricoColaboradorPageState(
        loading: true,
        historicosColaboradores: [],
      ),
    );
    try {
      (String, List<ConsultaHistoricoColaboradorModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaHistoricoColaboradorModel> historicosColaboradores =
          itens.$2;
      emit(
        ConsultaHistoricoColaboradorPageState(
          loading: false,
          historicosColaboradores: historicosColaboradores,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaHistoricoColaboradorPageState(
          loading: false,
          historicosColaboradores: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaHistoricoColaboradorPageState {
  final bool loading;
  final List<ConsultaHistoricoColaboradorModel> historicosColaboradores;
  final String error;
  final String message;

  ConsultaHistoricoColaboradorPageState({
    required this.loading,
    required this.historicosColaboradores,
    this.error = '',
    this.message = '',
  });
}
