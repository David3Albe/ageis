import 'package:ageiscme_data/query_services/equipamento_manutencao/consulta_manutencao_service.dart';
import 'package:ageiscme_models/query_filters/equipamento_manutencao/consulta_manutencao_filter.dart';
import 'package:ageiscme_models/query_models/equipamento_manutencao/consulta_manutencao_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaManutencaoPageCubit extends Cubit<ConsultaManutencaoPageState> {
  final ConsultaManutencaoService service;
  ConsultaManutencaoPageCubit({required this.service})
      : super(
          ConsultaManutencaoPageState(
            manutencoes: [],
            loading: false,
          ),
        );

  void loadManutencao(ConsultaManutencaoFilter filter) async {
    emit(
      ConsultaManutencaoPageState(
        loading: true,
        manutencoes: [],
      ),
    );
    try {
      (String, List<ConsultaManutencaoModel>)? itens = await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaManutencaoModel> manutencoes = itens.$2;
      emit(
        ConsultaManutencaoPageState(
          loading: false,
          manutencoes: manutencoes,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaManutencaoPageState(
          loading: false,
          manutencoes: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaManutencaoPageState {
  final bool loading;
  final List<ConsultaManutencaoModel> manutencoes;
  final String error;
  final String message;

  ConsultaManutencaoPageState({
    required this.loading,
    required this.manutencoes,
    this.error = '',
    this.message = '',
  });
}
