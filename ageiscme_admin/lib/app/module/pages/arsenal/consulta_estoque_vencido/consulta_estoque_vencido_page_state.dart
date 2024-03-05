import 'package:ageiscme_data/query_services/estoque_vencido/consulta_estoque_vencido_service.dart';
import 'package:ageiscme_models/query_filters/estoque_vencido/consulta_estoque_vencido_filter.dart';
import 'package:ageiscme_models/query_models/estoque_vencido/consulta_estoque_vencido_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaEstoqueVencidoPageCubit
    extends Cubit<ConsultaEstoqueVencidoPageState> {
  final ConsultaEstoqueVencidoService service;
  ConsultaEstoqueVencidoPageCubit({required this.service})
      : super(
          ConsultaEstoqueVencidoPageState(
            estoquesVencidos: [],
            loading: false,
          ),
        );

  void loadEstoqueVencido(ConsultaEstoqueVencidoFilter filter) async {
    emit(
      ConsultaEstoqueVencidoPageState(
        loading: true,
        estoquesVencidos: [],
      ),
    );
    try {
      (String, List<ConsultaEstoqueVencidoModel>)? itens = await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaEstoqueVencidoModel> estoquesVencidos = itens.$2;
      emit(
        ConsultaEstoqueVencidoPageState(
          loading: false,
          estoquesVencidos: estoquesVencidos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaEstoqueVencidoPageState(
          loading: false,
          estoquesVencidos: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaEstoqueVencidoPageState {
  final bool loading;
  final List<ConsultaEstoqueVencidoModel> estoquesVencidos;
  final String error;
  final String message;

  ConsultaEstoqueVencidoPageState({
    required this.loading,
    required this.estoquesVencidos,
    this.error = '',
    this.message = '',
  });
}
