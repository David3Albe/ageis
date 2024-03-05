import 'package:ageiscme_data/services/insumo_movimento/insumo_movimento_service.dart';
import 'package:ageiscme_models/filters/insumo_movimento/insumo_movimento_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InsumoMovimentoPageCubit extends Cubit<InsumoMovimentoPageState> {
  final InsumoMovimentoService service;
  InsumoMovimentoPageCubit({required this.service})
      : super(
          InsumoMovimentoPageState(
            insumosMovimentos: [],
            loading: false,
          ),
        );

  void loadInsumoMovimentoFilter(InsumoMovimentoFilter filter) async {
    emit(
      InsumoMovimentoPageState(
        loading: true,
        insumosMovimentos: [],
      ),
    );
    try {
      List<InsumoMovimentoModel>? itens = await service.Filter(filter);
      List<InsumoMovimentoModel> insumosMovimentos = itens;
      emit(
        InsumoMovimentoPageState(
          loading: false,
          insumosMovimentos: insumosMovimentos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        InsumoMovimentoPageState(
          loading: false,
          insumosMovimentos: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(InsumoMovimentoModel insumoMovimento) async {
    try {
      (String, InsumoMovimentoModel)? result =
          await service.delete(insumoMovimento);
      if (result == null) return;
      emit(
        InsumoMovimentoPageState(
          loading: false,
          insumosMovimentos: state.insumosMovimentos,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        InsumoMovimentoPageState(
          loading: false,
          insumosMovimentos: state.insumosMovimentos,
          error: ex.toString(),
        ),
      );
    }
  }
}

class InsumoMovimentoPageState {
  final bool loading;
  final bool deleted;
  final List<InsumoMovimentoModel> insumosMovimentos;
  final String error;
  final String message;

  InsumoMovimentoPageState({
    required this.loading,
    required this.insumosMovimentos,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
