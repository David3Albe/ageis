import 'package:ageiscme_data/query_services/estoque_disponivel_rotulado/consulta_estoque_disponivel_rotulado_service.dart';
import 'package:ageiscme_models/query_filters/estoque_disponivel_rotulado/consulta_estoque_disponivel_rotulado_filter.dart';
import 'package:ageiscme_models/query_models/estoque_disponivel_rotulado/consulta_estoque_disponivel_rotulado_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaEstoqueDisponivelRotuladoPageCubit
    extends Cubit<ConsultaEstoqueDisponivelRotuladoPageState> {
  final ConsultaEstoqueDisponivelRotuladoService service;
  ConsultaEstoqueDisponivelRotuladoPageCubit({required this.service})
      : super(
          ConsultaEstoqueDisponivelRotuladoPageState(
            estoquesDisponiveisRotulados: [],
            loading: false,
          ),
        );

  void loadEstoqueDisponivelRotulado(
    ConsultaEstoqueDisponivelRotuladoFilter filter,
  ) async {
    emit(
      ConsultaEstoqueDisponivelRotuladoPageState(
        loading: true,
        estoquesDisponiveisRotulados: [],
      ),
    );
    try {
      (String, List<ConsultaEstoqueDisponivelRotuladoModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaEstoqueDisponivelRotuladoModel>
          estoquesDisponiveisRotulados = itens.$2;
      emit(
        ConsultaEstoqueDisponivelRotuladoPageState(
          loading: false,
          estoquesDisponiveisRotulados: estoquesDisponiveisRotulados,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaEstoqueDisponivelRotuladoPageState(
          loading: false,
          estoquesDisponiveisRotulados: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaEstoqueDisponivelRotuladoPageState {
  final bool loading;
  final List<ConsultaEstoqueDisponivelRotuladoModel>
      estoquesDisponiveisRotulados;
  final String error;
  final String message;

  ConsultaEstoqueDisponivelRotuladoPageState({
    required this.loading,
    required this.estoquesDisponiveisRotulados,
    this.error = '',
    this.message = '',
  });
}
