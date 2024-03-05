import 'package:ageiscme_data/query_services/motivo_remover_repor_item/consulta_remover_repor_item_service.dart';
import 'package:ageiscme_models/query_filters/motivo_remover_repor_item/consulta_remover_repor_item_filter.dart';
import 'package:ageiscme_models/query_models/motivo_remover_repor_item/consulta_remover_repor_item_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ConsultaRemoverReporItemPageCubit
    extends Cubit<ConsultaRemoverReporItemPageState> {
  final ConsultaRemoverReporItemService service;
  ConsultaRemoverReporItemPageCubit({required this.service})
      : super(
          ConsultaRemoverReporItemPageState(
            itens: [],
            loading: false,
          ),
        );

  void loadMotivoRemoverReporItem(ConsultaRemoverReporItemFilter filter) async {
    emit(
      ConsultaRemoverReporItemPageState(
        loading: true,
        itens: [],
      ),
    );
    try {
      (String, List<ConsultaRemoverReporItemModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;
      List<ConsultaRemoverReporItemModel> motivoRemoverReporItens = itens.$2;
      emit(
        ConsultaRemoverReporItemPageState(
          loading: false,
          itens: motivoRemoverReporItens,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaRemoverReporItemPageState(
          loading: false,
          itens: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaRemoverReporItemPageState {
  final bool loading;
  final List<ConsultaRemoverReporItemModel> itens;
  final String error;
  final String message;

  ConsultaRemoverReporItemPageState({
    required this.loading,
    required this.itens,
    this.error = '',
    this.message = '',
  });
}
