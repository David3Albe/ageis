import 'package:ageiscme_data/query_services/insumo_estoque/consulta_insumo_estoque_service.dart';
import 'package:ageiscme_models/query_filters/insumo_estoque/consulta_insumo_estoque_filter.dart';
import 'package:ageiscme_models/query_models/insumo_estoque/consulta_insumo_estoque_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaInsumoEstoquePageCubit
    extends Cubit<ConsultaInsumoEstoquePageState> {
  final ConsultaInsumoEstoqueService service;
  ConsultaInsumoEstoquePageCubit({required this.service})
      : super(
          ConsultaInsumoEstoquePageState(
            insumosEstoques: [],
            loading: false,
          ),
        );

  void loadInsumoEstoque(ConsultaInsumoEstoqueFilter filter) async {
    emit(
      ConsultaInsumoEstoquePageState(
        loading: true,
        insumosEstoques: [],
      ),
    );
    try {
      (String, List<ConsultaInsumoEstoqueModel>)? itens = await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaInsumoEstoqueModel> insumosEstoques = itens.$2;
      emit(
        ConsultaInsumoEstoquePageState(
          loading: false,
          insumosEstoques: insumosEstoques,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaInsumoEstoquePageState(
          loading: false,
          insumosEstoques: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaInsumoEstoquePageState {
  final bool loading;
  final List<ConsultaInsumoEstoqueModel> insumosEstoques;
  final String error;
  final String message;

  ConsultaInsumoEstoquePageState({
    required this.loading,
    required this.insumosEstoques,
    this.error = '',
    this.message = '',
  });
}
