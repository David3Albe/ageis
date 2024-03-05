import 'package:ageiscme_data/query_services/movimento_estoque/consulta_movimentacao_estoque_service.dart';
import 'package:ageiscme_models/query_filters/movimento_estoque/consulta_movimentacao_estoque_filter.dart';
import 'package:ageiscme_models/query_models/movimento_estoque/consulta_movimentacao_estoque_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaMovimentacaoEstoquePageCubit
    extends Cubit<ConsultaMovimentacaoEstoquePageState> {
  final ConsultaMovimentacaoEstoqueService service;
  ConsultaMovimentacaoEstoquePageCubit({required this.service})
      : super(
          ConsultaMovimentacaoEstoquePageState(
            movimentacoesEstoques: [],
            loading: false,
          ),
        );

  void loadMovimentacaoEstoque(ConsultaMovimentacaoEstoqueFilter filter) async {
    emit(
      ConsultaMovimentacaoEstoquePageState(
        loading: true,
        movimentacoesEstoques: [],
      ),
    );
    try {
      (String, List<ConsultaMovimentacaoEstoqueModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaMovimentacaoEstoqueModel> movimentacoesEstoques = itens.$2;
      emit(
        ConsultaMovimentacaoEstoquePageState(
          loading: false,
          movimentacoesEstoques: movimentacoesEstoques,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaMovimentacaoEstoquePageState(
          loading: false,
          movimentacoesEstoques: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaMovimentacaoEstoquePageState {
  final bool loading;
  final List<ConsultaMovimentacaoEstoqueModel> movimentacoesEstoques;
  final String error;
  final String message;

  ConsultaMovimentacaoEstoquePageState({
    required this.loading,
    required this.movimentacoesEstoques,
    this.error = '',
    this.message = '',
  });
}
