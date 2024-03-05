import 'package:ageiscme_data/query_services/estoque_disponivel/consulta_estoque_disponivel_service.dart';
import 'package:ageiscme_models/query_filters/estoque_disponivel/consulta_estoque_disponivel_filter.dart';
import 'package:ageiscme_models/query_models/estoque_disponivel/consulta_estoque_disponivel_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaEstoqueDisponivelPageCubit
    extends Cubit<ConsultaEstoqueDisponivelPageState> {
  final ConsultaEstoqueDisponivelService service;
  ConsultaEstoqueDisponivelPageCubit({required this.service})
      : super(
          ConsultaEstoqueDisponivelPageState(
            estoquesDisponiveis: [],
            loading: false,
          ),
        );

  void loadEstoqueDisponivel(ConsultaEstoqueDisponivelFilter filter) async {
    emit(
      ConsultaEstoqueDisponivelPageState(
        loading: true,
        estoquesDisponiveis: [],
      ),
    );
    try {
      (String, List<ConsultaEstoqueDisponivelModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaEstoqueDisponivelModel> estoquesDisponiveis = itens.$2;
      emit(
        ConsultaEstoqueDisponivelPageState(
          loading: false,
          estoquesDisponiveis: estoquesDisponiveis,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaEstoqueDisponivelPageState(
          loading: false,
          estoquesDisponiveis: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaEstoqueDisponivelPageState {
  final bool loading;
  final List<ConsultaEstoqueDisponivelModel> estoquesDisponiveis;
  final String error;
  final String message;

  ConsultaEstoqueDisponivelPageState({
    required this.loading,
    required this.estoquesDisponiveis,
    this.error = '',
    this.message = '',
  });
}
