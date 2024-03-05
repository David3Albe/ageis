import 'package:ageiscme_data/query_services/insumo_saldo/consulta_insumo_saldo_service.dart';
import 'package:ageiscme_models/query_filters/insumo_saldo/consulta_insumo_saldo_filter.dart';
import 'package:ageiscme_models/query_models/insumo_saldo/consulta_insumo_saldo_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaInsumoSaldoPageCubit extends Cubit<ConsultaInsumoSaldoPageState> {
  final ConsultaInsumoSaldoService service;
  ConsultaInsumoSaldoPageCubit({required this.service})
      : super(
          ConsultaInsumoSaldoPageState(
            insumosSaldos: [],
            loading: false,
          ),
        );

  void loadInsumoSaldo(ConsultaInsumoSaldoFilter filter) async {
    emit(
      ConsultaInsumoSaldoPageState(
        loading: true,
        insumosSaldos: [],
      ),
    );
    try {
      (String, List<ConsultaInsumoSaldoModel>)? itens = await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaInsumoSaldoModel> insumosSaldos = itens.$2;
      emit(
        ConsultaInsumoSaldoPageState(
          loading: false,
          insumosSaldos: insumosSaldos,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaInsumoSaldoPageState(
          loading: false,
          insumosSaldos: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaInsumoSaldoPageState {
  final bool loading;
  final List<ConsultaInsumoSaldoModel> insumosSaldos;
  final String error;
  final String message;

  ConsultaInsumoSaldoPageState({
    required this.loading,
    required this.insumosSaldos,
    this.error = '',
    this.message = '',
  });
}
